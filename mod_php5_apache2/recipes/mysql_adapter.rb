package 'php-mysql' do
  package_name value_for_platform_family(
    'rhel' => 'php-mysql',
    'debian' => 'php56-mysqlnd'
  )
end