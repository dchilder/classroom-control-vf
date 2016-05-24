class skeleton
{
file { '/etc/skel':
ensure => directory,
mode => '0755',
}
file { '/etc/skel/.bashrc':
ensure => file,
owner => 'root',
group => 'root',
mode => '0440',
}
}
