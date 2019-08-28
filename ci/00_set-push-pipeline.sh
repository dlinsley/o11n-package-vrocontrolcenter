fly -t main set-pipeline \
  --pipeline push_packages_vrocontrolcenter \
  --config push_pipeline.yml \
  --var "private-repo-key=$(cat myrsa.key)"

fly -t main unpause-pipeline -p push_packages_vrocontrolcenter

