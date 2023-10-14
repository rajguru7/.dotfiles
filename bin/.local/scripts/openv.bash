#!/usr/bin/bash
(return 0 2>/dev/null) && sourced=1 || { echo "must be sourced" && exit 1; }
if ! op item list > /dev/null 2>&1; then
    eval $(op signin)
fi
eval export GITHUB_TOKEN=$(op read op://Personal/zc3wfc7xcblkus2ttwxh5q52nq/token)
