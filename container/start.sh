#!/bin/bash

DIRECTORY="/output"

source /workspace-automation/setup_env.sh;
export GEN_SNAPSHOT=/workspace-automation/sdk/clang_x64/gen_snapshot
python3 /workspace-automation/create_aot.py --app-path /flutter-app/

cp /flutter-app/libapp* /tmp/
