#!/usr/bin/env bash
if [ -f "$load_spec" ]; then
    echo "loading $load_spec"
else 
    echo "$load_spec does not exist - must exit"
    exit 1
fi
export PYTHONPATH=/home/pierce/METdb/METdbLoad/ush
time python3 /home/pierce/METdb/METdbLoad/ush/met_db_load.py $load_spec
