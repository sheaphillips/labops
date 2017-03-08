#!/usr/bin/env bash

for student in {6..10}
do
    student_name="student${student}"
    project_name="${student_name}-lab"

    oc new-app --template=mongodb-ephemeral --param=MEMORY_LIMIT=64Mi -n $project_name
done
