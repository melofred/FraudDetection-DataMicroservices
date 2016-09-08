#!/bin/bash

#SCDF_BUILD_PATH=/Users/fmelo/scdf
export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_URL=http://api.local.pcfdev.io
export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_ORG=pcfdev-org
export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_SPACE=pcfdev-space
export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_DOMAIN=local.pcfdev.io
export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_SERVICES=rabbit,redis
export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_USERNAME=admin
export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_PASSWORD=admin
export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_SKIP_SSL_VALIDATION=true

export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_MEMORY=384
export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_DISK=512

export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_ENABLE_RANDOM_APP_NAME_PREFIX=false
export SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_BUILDPACK=java_buildpack

# export MAVEN_OFFLINE=true
export MAVEN_REMOTE_REPOSITORIES_REPO1_URL=https://repo.spring.io/release

scdf_jar="./spring-cloud-dataflow-server-cloudfoundry-1.0.0.RELEASE.jar"

if [ -f "$scdf_jar" ]
then
	echo "$scdf_jar found."
else
	echo "Download: $scdf_jar "
  wget http://repo.spring.io/libs-release/org/springframework/cloud/spring-cloud-dataflow-server-cloudfoundry/1.0.0.RELEASE/spring-cloud-dataflow-server-cloudfoundry-1.0.0.RELEASE.jar
fi

scdf_shel_jar="./pring-cloud-dataflow-shell-1.0.0.RELEASE.jar"

if [ -f "$scdf_shel_jar" ]
then
	echo "$scdf_shel_jar found."
else
	echo "Download: $scdf_shel_jar "
  wget http://repo.spring.io/libs-release/org/springframework/cloud/spring-cloud-dataflow-shell/1.0.0.RELEASE/spring-cloud-dataflow-shell-1.0.0.RELEASE.jar
fi


java -jar ./spring-cloud-dataflow-server-cloudfoundry-1.0.0.RELEASE.jar

