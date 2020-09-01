#!/bin/bash

read -p 'Course ID: ' course_id

cd /opt/bitnami/apps/edx/edx-platform
sudo -u bitnami ../bin/python.edxapp ./manage.py lms dump_course_ids --settings aws
sudo -u bitnami ../bin/python.edxapp ./manage.py cms --settings=aws delete_orphans $course_id --commit
sudo -u bitnami ../bin/python.edxapp ./manage.py cms --settings=aws delete_course $course_id
