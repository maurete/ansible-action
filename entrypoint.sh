#!/usr/bin/env bash

set -e

# fail if INPUT_PLAYBOOK is not set
if [[ -z "${INPUT_PLAYBOOK}" ]]
then
  echo "Required variable \`playbook\` is missing"
  exit 1
fi

if [[ -n "${INPUT_WORKING_DIRECTORY}" ]]
then
  cd "${INPUT_WORKING_DIRECTORY}"
fi

if [[ -n "${INPUT_AWS_ACCESS_KEY_ID}" ]]
then
  export AWS_ACCESS_KEY_ID="${INPUT_AWS_ACCESS_KEY_ID}"
fi

if [[ -n "${INPUT_AWS_SECRET_ACCESS_KEY}" ]]
then
  export AWS_SECRET_ACCESS_KEY="${INPUT_AWS_SECRET_ACCESS_KEY}"
fi

if [[ -n "${INPUT_AWS_REGION}" ]]
then
  export AWS_REGION="${INPUT_AWS_REGION}"
fi

if [[ -n "${INPUT_AWS_SESSION_TOKEN}" ]]
then
  export AWS_SESSION_TOKEN="${INPUT_AWS_SESSION_TOKEN}"
fi

COMMAND=ansible-playbook

if [[ -n "${INPUT_ARGUMENTS}" ]]
  COMMAND="${COMMAND} ${INPUT_ARGUMENTS} ${INPUT_PLAYBOOK}"
fi

if [[ -n "${INPUT_EXTRA_VARS_YAML}" ]]
  echo "${INPUT_EXTRA_VARS_YAML}" > /tmp/extra_vars.yaml
  COMMAND="${COMMAND} -e @/tmp/extra_vars.yaml"
fi

COMMAND="${COMMAND} ${INPUT_PLAYBOOK}"

echo "::debug:: Executing command: ${COMMAND}"
echo ::set-output name=command::${COMMAND}

${COMMAND}
