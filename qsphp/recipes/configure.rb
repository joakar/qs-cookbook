node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping qsphp::configure application #{application} as it is not an PHP app")
    next
  end

  template "/etc/php.d/qs.ini" do
    cookbook 'qsphp'
    source 'qs.ini.erb'
    mode '0644'
    owner 'root'
    group 'root'
  end
  remote_file "Copy bin folder" do 
    path "/var/inc" 
    source "#{deploy[:deploy_to]}/current/bin"
    owner 'root'
    group 'root'
    mode 0755
    end
  end
end
