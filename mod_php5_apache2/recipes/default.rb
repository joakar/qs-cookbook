include_recipe 'apache2'

bad_packages =  ["httpd","httpd-tools"]

bad_packages.each do |pkg|
  package pkg do
    action :remove
  end
end

node[:mod_php5_apache2][:packages].each do |pkg|
  package pkg do
    action :install
    ignore_failure(pkg.to_s.match(/^php-pear-/) ? true : false) # some pear packages come from EPEL which is not always available
  end
end

include_recipe 'apache2::mod_php5'
