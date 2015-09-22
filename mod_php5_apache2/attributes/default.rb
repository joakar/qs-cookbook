###
# Do not use this file to override the mod_php5_apache2 cookbook's default
# attributes.  Instead, please use the customize.rb attributes file,
# which will keep your adjustments separate from the AWS OpsWorks
# codebase and make it easier to upgrade.
#
# However, you should not edit customize.rb directly. Instead, create
# "mod_php5_apache2/attributes/customize.rb" in your cookbook repository and
# put the overrides in YOUR customize.rb file.
#
# Do NOT create an 'mod_php5_apache2/attributes/default.rb' in your cookbooks. Doing so
# would completely override this file and might cause upgrade issues.
#
# See also: http://docs.aws.amazon.com/opsworks/latest/userguide/customizing.html
###
packages = [ 'php56-common',
            'php56-cli',
            'php56-gd',
            'php56-intl',
            'php56-mcrypt',
            'php56-imap',
            'php56-mysqlnd']


default[:mod_php5_apache2][:packages] = packages

include_attribute "mod_php5_apache2::customize"
