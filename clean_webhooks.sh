#!/usr/bin/env bash

for student in {1..20}
do
    student_name="student${student}"
    project_name="${student_name}-lab"
    repo_name="${student_name}_lab"

    id=$(curl -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/repos/C3IDigitalLiteracyLab/$repo_name/hooks | awk '/id/{print $2}' | sed 's/,$//')

    curl -X "DELETE" -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/repos/C3IDigitalLiteracyLab/${repo_name}/hooks/$id
done
