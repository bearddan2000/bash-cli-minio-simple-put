# bash-cli-minio-simple-put

## Description
A POC for minio, local s3 storage.
Uses `minio/mc` service to create a bucket
named *test-bucket* on the `minio/minio` service.
The `ubuntu:latest` service uses the *curl* command
to upload a zipped file to `minio/minio` service.

## Tech stack
- bash
- minio
  - aws
  - s3

## Docker stack
- ubuntu:latest
- minio/minio
- minio/mc

## To run
`sudo ./install.sh -u`

## To stop
`sudo ./install.sh -d`

## For help
`sudo ./install.sh -h`
