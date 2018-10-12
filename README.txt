V dockeru je ulozeny jak model, tak zdrojak, staci ho tedy pustit jen na datech a docker vypise predikci.

Ja ho poustim napriklad takto:

sudo docker run --rm -it --privileged simonmandlik/mini:baseline $bucket_name $bucket_prefix

kde $bucket_name je url s3 bucketu, na kterem jsou data, napr. hobbiton-eu-west-1-nn 
a $bucket_prefix je prefix v ramci tohoto bucketu, napr. docker_test/
K pristupu na docker jsou pouzity metadata ec2, tak je treba, aby dana instance byla ve spravne
security group.

Slozka s experimenty, ktera je na ceste $bucket_name/$bucket_prefix, musi obsahovat:

1) jeden soubor jmenem "data_folder.txt", kde je jediny radek, pouze jmeno adresare daneho datasetu/experimentu (tedy je to 
relativni cesta vzhledem k $bucket_name/$bucket_prefix, pokud budu mit ve slozce s experimenty dva adresare ->
"experiment1" a "experiment2", bude "data_folder.txt" obsahovat jediny radek s jednim z techto dvou stringu,
a ne cele cesty k temto adresarum).

2) V danem adresari, kde je treba vyhodnotit data, musi byt jednak ground truth (opet presny nazev "jira-cluster-definitions-sm.json"),
jednak samotny graf, na kterem bude probihat inference. Ten musi byt ve stejnem formatu jako na s3, tedy nekolik zazipovanych textaku.

Spravna konfigurace muze vypadat treba takto:

docker_test/
├── data_folder.txt
├── experiment1
│   ├── graph
│   │   ├── graph1.tsv.gz
│   │   ├── graph2.tsv.gz
│   │   └── graph3.tsv.gz
│   └── jira-cluster-definitions-sm.json
└── experiment2
    ├── graph
    │   ├── graph1.tsv.gz
    │   ├── graph2.tsv.gz
    │   └── graph3.tsv.gz
    └── jira-cluster-definitions-sm.json

Evaluace trva +- 12 hodin na tydennim grafu.
Pote, co kontejner dokonci praci na napr. "experiment1", bude adresar vypadat takto:

experiment1/
├── 2018-10-08_7447855286846333205
│   ├── evaluate.json
│   ├── log.txt
│   ├── pred
│   │   ├── pred-1.txt
│   │   ├── pred-2.txt
│   │   ├── pred-3.txt
│   │   └── pred.txt
│   └── seed
│       ├── seed-1.txt
│       ├── seed-2.txt
│       └── seed-3.txt
├── graph
│   ├── graph1.tsv.gz
│   ├── graph2.tsv.gz
│   └── graph3.tsv.gz
└── jira-cluster-definitions-sm.json

Pribyla nova slozka s datumem a hashi casu, ve ktere jsou vysledky dane evaluace (tak je mozne
vyhodnocovat vicekrat na stejnem datasetu), v ni je:

1) evaluate.json -> vnitrni nastaveni evaluacniho protokolu
2) log.txt -> logy
3) pred -> adresar s predikcema pro jednotlive foldy a pak s maximem pres foldy
4) seed -> adresar se seed files.
