#!/bin/bash
for VRO_HOST in $VRO_HOSTS
do
  for PKG in $(ls gh-release/*.package)
  do
    echo "Pushing $PKG to $VRO_HOST"
    curl --netrc-file <(cat <<<"machine $VRO_HOST login $VRO_USERNAME password $VRO_PASSWORD") \
      --silent --show-error --insecure --request POST \
      -F file=@$PKG -F overwrite=true -F importConfigurationAttributeValues=false \
      https://$VRO_HOST:8281/vco/api/packages
    if [ $? -eq 0 ]; then
      echo -e "=== Successfully pushed package $PKG to $VRO_HOST"
    else
      echo -e "xxx Something went wrong while pushing $PKG to $VRO_HOST"
    fi
  done
done
