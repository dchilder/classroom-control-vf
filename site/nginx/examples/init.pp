if $::osfamily == 'Windows' {
Package {
  provider => chocolatey,
}
}
node default {
  include nginx
  }
