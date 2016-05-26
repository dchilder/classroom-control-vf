class nginx::params{
  case $::osfamily{
    'redhat','debian':{
      $package='nginx'
      $owner='root'
      $group='root'
      $docroot='/var/www'
      $confdir='/etc/nginx'
      $logdir='/var/log/nginx'
      }
    default:{
      fail("${module_name} is not supported on ${::osfamily} you big dummy")
      }
    }
    $user=$::osfamily ? {
      'redhat' => 'nginx',
      'debian' => 'www-data',
      'windows' => 'nobody',
      }
  }
