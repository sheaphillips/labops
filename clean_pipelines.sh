#!/usr/bin/env bash

for student in {1..20}
do
    student_name="student${student}"
    project_name="${student_name}-lab"

    oc delete bc ${project_name}-lab-pipeline -n lab-tools
done
