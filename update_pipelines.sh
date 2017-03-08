#!/usr/bin/env bash


for student in {1..20}
do
    student_name="student${student}"
    project_name="${student_name}-lab"

    # update the pipeline in the tools project for each project
    oc process -f openshift/lab-pipeline.json -v LAB_PROJECT=${project_name} | oc replace -n lab-tools  -f -
done
