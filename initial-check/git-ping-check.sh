#!/bin/bash

GIT_COM_HOSNAME=shou7sc
GIT_SSH_SECRET_KEY_NAME=

ssh -i ~/.ssh/$GIT_SSH_SECRET_KEY_NAME -T git@github.com

