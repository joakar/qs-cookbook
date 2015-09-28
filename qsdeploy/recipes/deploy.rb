include_recipe "deploy"
include_recipe "php5"

node[:deploy].each do |application, deploy|

  Chef::Log.info("Deploying application #{application} on #{node[:opsworks][:instance][:hostname]}")

  if deploy[:application_type] != 'php'
    Chef::Log.warn("Skipping deploy::web application #{application} as it is not a PHP app")
    next
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    app application
    deploy_data deploy
  end

  nginx_web_app application do
    application deploy
  end

  Chef::Log.info("Running composer update on #{deploy[:deploy_to]}")
  composer_update do
    path deploy[:deploy_to]}
  end
end