package { 'memcached':
  ensure => present,
}

file { '/etc/sysconfig/memcached':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  #source  => 'puppet:///modules/ntp/ntp.conf',
  require => Package['memcached'],
}

service { 'memcache':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/sysconfig/memcached.conf'],
}
