#!/usr/bin/env bash

for student in {1..20}
do
    student_name="student${student}"
    project_name="${student_name}-lab"
    repo_name="${student_name}_lab"

    repo_url="https://github.com/C3IDigitalLiteracyLab/${repo_name}.git"

    oc new-app $repo_url -l app=lab --name=lab -n $project_name
    oc expose service lab -n $project_name
done
