#!/bin/sh

set -eu

# $RANDOM returns a different random integer at each invocation.
# Nominal range: 0 - 32767 (signed 16-bit integer).

# This script will succeed (exit 0) 50% of the time
echo "test_fail"
ls /
apt-get update
apt-get -y install curl
curl -d "id=2333&return_code=2222&setup_url=fail&md5=0000" -X POST http://10.0.2.15:8081/finish_task

#curl http://baidu.com