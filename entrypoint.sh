#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo `pwd`

export PYTHONPATH="/app"

cd jira_backlog_estimator

python ./manage.py runserver 0.0.0.0:8000