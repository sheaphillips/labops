#!/usr/bin/env bash

for student in {1..20}
do
    student_name="student${student}"
    project_name="${student_name}-lab"
    project_user=${student_name}

    oc new-project $project_name --display-name="${student_name} - Digital Literacy Course Lab 1" --description="Digital Literacy Course Lab 1 - ToDo App"

    oc policy add-role-to-user edit $project_user -n $project_name
done
