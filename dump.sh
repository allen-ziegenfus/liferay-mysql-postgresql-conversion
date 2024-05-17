#!/bin/bash
USERNAME=dxpcloud
HOST=localhost
DATABASE=lportal
pg_dump -U ${USERNAME} --format=plain --no-owner --no-acl -h ${HOST} -d ${DATABASE} > postgresmigrated.sql
