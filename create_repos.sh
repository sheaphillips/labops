#!/usr/bin/env bash

for student in {5..20}
do
    repo_name="student${student}_lab"
    echo "Creating ${repo_name}..."
    payload="{\"name\":\"$repo_name\"}"
    echo "Payload: ${payload}"
    curl -i -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/orgs/C3IDigitalLiteracyLab/repos -d $payload
done

