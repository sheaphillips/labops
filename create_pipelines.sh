#!/usr/bin/env bash

for student in {1..20}
do
    student_name="student${student}"
    project_name="${student_name}-lab"

    # create the pipeline in the tools project for each project
    oc process -f openshift/lab-pipeline.json -v LAB_PROJECT=${project_name} | oc create -n lab-tools  -f -

    # create the prod DeploymentConfig in each project that will watch for the "prod" tag on the project's lab imagestream
    oc process -f openshift/lab-prod-deploy.json -v LAB_PROJECT=${project_name} | oc create -n ${project_name} -f -
    oc expose dc lab-prod --name=lab-prod --port=2015 -n $project_name
    oc expose service lab-prod -n $project_name

    # provide access to the student project from the tool project
    oc adm policy add-role-to-user edit system:serviceaccount:lab-tools:jenkins -n ${project_name}

    # provide *view* access to the student *user* to the lab-tools project so they can approve the deployment from Jenkins
    oc adm policy add-role-to-user view ${student_name} -n lab-tools
done
