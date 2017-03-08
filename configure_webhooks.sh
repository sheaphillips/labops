#!/usr/bin/env bash

for student in {1..20}
do
    student_name="student${student}"
    project_name="${student_name}-lab"
    repo_name="${student_name}_lab"
    pipeline_name=${project_name}-lab-pipeline

    repo_url="https://github.com/C3IDigitalLiteracyLab/${repo_name}.git"


    webhook_url=$(oc describe bc ${pipeline_name} -n lab-tools | grep -A1 GitHub | awk '/URL/{print $2}')

    echo "Webhook URL for $student_name is '$webhook_url'"
    read -r -d '' payload << EOM
    {
      "name": "web",
      "events": [
        "push"
      ],
      "config": {
        "url": "${webhook_url}",
        "content_type": "json",
        "insecure_ssl": "1"
      }
    }
EOM

    curl -i -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/repos/C3IDigitalLiteracyLab/${repo_name}/hooks -d "$payload"
done




