class nginx::params {
  case $::osfamily {
    'redhat','debian':{
      $package='nginx',
      $owner='root',
      $group='root',
      $docroot='/var/www',
      $confdir='/etc/nginx',
      $logdir='/var/log/nginx',
      }
    'windows' :{
      $package='nginx',
      $owner='Administrator',
      $group='Administrators'
      $docroot='c:/programdata/nginx/index.html',
      $confdir='c:/programdata/nginx',
      $logdir= 'c:/progrramdata/nginx/logs',
      }
    default :{
      fail("${module_name} is not supported on ${::osfamily} you big dummy")
      }
    }
    $user=$::osfamily ? {
      'redhat' => 'nginx',
      'debian' => 'www-data',
      'windows' => 'nobody',
      }
  }
