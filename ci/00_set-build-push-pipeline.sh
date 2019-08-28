fly -t main set-pipeline \
  --pipeline build_push_packages_vrocontrolcenter \
  --config build_and_push_pipeline.yml \
  --var "private-repo-key=$(cat myrsa.key)"

fly -t main unpause-pipeline -p build_push_packages_vrocontrolcenter

