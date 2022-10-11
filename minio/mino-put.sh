#!/bin/bash

# usage: ./minio-upload my-bucket my-file.zip

bucket=$1
file=$2

host="minio:9000"
s3_key="minio"
s3_secret="minio123"

base_file=`basename ${file}`
resource="/${bucket}/${base_file}"
content_type="gzip"
date=`date -R`
_signature="PUT\n\n${content_type}\n${date}\n${resource}"
signature=`echo -en ${_signature} | openssl sha1 -hmac ${s3_secret} -binary | base64`

curl -v -X PUT -T "${file}" \
          -data-binary @'/tmp/sample.tar.gz' \
          -H "Host: $host" \
          -H "Date: ${date}" \
          -H "Content-Type: ${content_type}" \
          -H "Authorization: AWS ${s3_key}:${signature}" \
          http://$host${resource}
