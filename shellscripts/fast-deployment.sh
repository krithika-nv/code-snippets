...
if [[ ${DEPLOY_TYPE} == "reqd-config" ]]
then
  if [[ ${DEBUG} == "true" ]]
  then 
    echo "yq w -i kubernetes/directory/${FILE_NAME} "${YAML_CONFIG_PATH}.\"${CONFIG_FILE}\"" "${CONFIG_FILE_CONTENT}""
  fi
  yq w -i kubernetes/directory/${FILE_NAME} "${YAML_CONFIG_PATH}.\"${CONFIG_FILE}\"" "${CONFIG_FILE_CONTENT}"
  if [[ ${TRIGGER_DEPLOYMENT_REDEPLOY} == "true" ]]
  then 
    if [[ ${DEBUG} == "true" ]]
    then 
      echo "yq w -i kubernetes/directory/deployment.yaml "spec.template.metadata.annotations.config-commit" ${GIT_COMMIT}" 
    fi
    yq w -i kubernetes/directory/deployment.yaml "spec.template.metadata.annotations.config-commit" ${GIT_COMMIT}
    git add kubernetes/directory/deployment.yaml
  fi
else
  IFS=, read -a YAML_IMAGE_PATHS <<< ${YAML_IMAGE_PATH}
  if [[ ${DEBUG} == "true" ]]
  then
    echo "yq w -i kubernetes/directory/${FILE_NAME} " "${YAML_IMAGE_PATHS[@]}" " ${DOCKER_REGISTRY}/${APP_NAME}:${NEW_VERSION}"
  fi
  for TARGET_IMAGE_PATH in "${YAML_IMAGE_PATHS[@]}"; do
    yq w -i kubernetes/directory/${FILE_NAME} ${TARGET_IMAGE_PATH} ${DOCKER_REGISTRY}/app/directory:${NEW_VERSION}
  done
fi
...