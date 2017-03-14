#!/usr/bin/env bash

# note this is not directly used, but this is the test that is pasted into the Jenkinsfile / pipeline.

test_result=$(curl http://lab-student20-lab.apps.cloudcompass.ca | grep "<title>AngularJS • TodoMVC</title>" | wc -l)

if [ $test_result -eq 0 ]; then
    echo "Test failed."
    exit 1
else
    echo "Test succeeded."
    exit 0
fi
