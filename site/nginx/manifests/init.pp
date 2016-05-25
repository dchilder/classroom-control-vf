class nginx {
  package { 'nginx':
    ensure => present,
  }
  file { '/var/www':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }
  file { '/var/www/index.html':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/index.html',
  }
  file { '/etc/nginx/nginx.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  file { ' /etc/nginx/conf.d':
    ensure => direcotry,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }
  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644'
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  {
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}