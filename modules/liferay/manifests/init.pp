# == Class: liferay
#
# Full description of class liferay here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'liferay':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#

class liferay(
    $http_server             = 'http://192.168.110.251',
    $version                 = '@@LRVER@@',
    $app_server              = '@@AS@@',
    $app_version             = '7.0.62',
    $patch                   = '@@PATCH@@',
    $patching_tool_version   = '1.0.23'
)
{

    require java
    
    Class['liferay::config'] -> Class['liferay::install'] -> Class['liferay::run'] 
    
    include liferay::config
    include liferay::install
    include liferay::run

}
