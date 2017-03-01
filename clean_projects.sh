#!/usr/bin/env bash

#!/usr/bin/env bash

for student in {1..20}
do
    student_name="student${student}"
    project_name="${student_name}-lab"

    echo "Cleaning project ${project_name}..."

    oc delete all --all -n $project_name
done

