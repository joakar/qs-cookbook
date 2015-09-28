node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping qsphp::configure application #{application} as it is not an PHP app")
    next
  end
 
  remote_directory '/var/inc' do
    source 'bin'
    owner 'root'
    group 'root'
    mode '0777'
    action :create
   end
end
