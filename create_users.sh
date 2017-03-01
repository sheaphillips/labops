#!/usr/bin/env bash

if [ -f "users.htpasswd" ]
then
    echo "Using existing htpasswd file..."
else
    touch "users.htpasswd"
fi

for student in {1..20}
do
    student_user_id="student${student}"
    long_password=$(date | md5 | md5)
    password=${long_password:0:8}
    echo "${password}" | htpasswd -i users.htpasswd ${student_user_id}
    echo "${student_user_id} ${password}" >> users.txt
    sleep 1
done
