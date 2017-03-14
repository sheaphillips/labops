#!/usr/bin/env bash

for student in {1..19}
do
    repo_name="student${student}_lab"
    echo "Deleting ${repo_name}..."

    curl -i -H "Authorization: token ${GITHUB_TOKEN}" -X DELETE https://api.github.com/repos/C3IDigitalLiteracyLab/${repo_name}
done

