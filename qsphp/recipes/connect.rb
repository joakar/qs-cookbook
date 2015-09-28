node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping php::configure application #{application} as it is not an PHP app")
    next
  end

  # write out opsworks.php
  template "#{deploy[:deploy_to]}/current/qsconnect.php" do
    cookbook 'qsphp'
    source 'qsconnect.php.erb'
    mode '0754'
    owner deploy[:user]
    group deploy[:group]
    variables(
      :database => deploy[:database],
      :environment => OpsWorks::Escape.escape_double_quotes(deploy[:environment_variables]),
      :memcached => deploy[:memcached],
      :layers => node[:opsworks][:layers],
      :stack_name => node[:opsworks][:stack][:name]
    )
    only_if do
      File.exists?("#{deploy[:deploy_to]}/current")
    end
  end
end