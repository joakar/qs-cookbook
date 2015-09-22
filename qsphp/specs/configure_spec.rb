require 'minitest/spec'

describe_recipe 'qsphp::configure' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

  it 'creates the php file for data exchange' do
    node[:deploy].each do |application, deploy|
      if deploy[:application_type] == 'php'
        file("/php5/apache2/conf.d/qs.ini").must_exist.with(:mode, '0644').and(:owner, 'root').and(:group, 'root')
      end
    end
  end
end
