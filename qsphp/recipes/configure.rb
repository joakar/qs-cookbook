node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping qsphp::configure application #{application} as it is not an PHP app")
    next
  end

  template "/etc/php.d/qs.ini" do
    cookbook 'php'
    source 'qs.ini.erb'
    mode '0644'
    owner 'root'
    group 'root'
    variables(:directives => node['php']['directives'])
  end
end
