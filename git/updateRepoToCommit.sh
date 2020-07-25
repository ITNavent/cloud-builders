#!/bin/bash

if [ -z "${CUSTOM_REPO_USER}" ] 
then
	echo "CUSTOM_REPO_USER env var cannot be empty"
  exit 1
fi

if [ -z "${CUSTOM_REPO_PASSWORD}" ]
then
	echo "CUSTOM_REPO_PASSWORD env var cannot be empty"
  exit 1
fi

if [ -z "${CUSTOM_REPO_URL}" ]
then
	echo "CUSTOM_REPO_URL env var cannot be empty"
  exit 1
fi

if [ -z "${CUSTOM_REPO_COMMIT}" ]
then
	echo "CUSTOM_REPO_COMMIT env var cannot be empty"
  exit 1
fi
git clone "https://${CUSTOM_REPO_USER}:${CUSTOM_REPO_PASSWORD}@${CUSTOM_REPO_URL}" repoTmp
git -C repoTmp fetch origin "${CUSTOM_REPO_COMMIT}"
git -C repoTmp checkout -qf FETCH_HEAD
mv repoTmp/.git .git
rm -rf repoTmp

