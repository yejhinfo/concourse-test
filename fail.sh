#!/bin/sh

set -eu

# $RANDOM returns a different random integer at each invocation.
# Nominal range: 0 - 32767 (signed 16-bit integer).

# This script will succeed (exit 0) 50% of the time
echo "test_fail"
ls /
apt-get install curl
#curl -d "id=2333&return_code=2222&setup_url=fail&md5=0000" -X POST http://127.0.0.1:8081/finish_task

