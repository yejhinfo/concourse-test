#!/bin/sh

set -eu

# $RANDOM returns a different random integer at each invocation.
# Nominal range: 0 - 32767 (signed 16-bit integer).

# This script will succeed (exit 0) 50% of the time
echo "test_status"
tee /etc/apt/sources.list << EOF
deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
EOF
apt-get update
apt-get -y install curl
status=`curl  http://10.0.2.15:8080/api/v1/teams/main/pipelines/tutorial-pipeline/jobs/test/builds/50 -X GET -H "Authorization: bearer wFimuRjZsV3rlg13iSs0uuBjMY4MgnhjAAAAAA"  | grep -Po '"status"[" :]+\K[^"]+'
`
curl -d "id=2333&return_code=2222&setup_url=$status&md5=0000" -X POST http://10.0.2.15:8082/finish_task