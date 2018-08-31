#!/bin/bash

s3fs $S3_BUCKET $S3 -o use_cache=/tmp -o iam_role=NN-EC2-Worker -o umask=002 -o use_sse=kmsid:'KMSID'
exec "$@"
