
include_attribute 'deploy::rails_stack'

node[:deploy].each do |application, deploy|
  normal[:deploy][application][:shallow_clone] = true
end