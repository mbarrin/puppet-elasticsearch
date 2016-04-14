# Public: Install and configure elasticsearch from homebrew.
#
# Examples
#
#   include elasticsearch
class elasticsearch2(
  $ensure         = $elasticsearch2::params::ensure,

  $version        = $elasticsearch2::params::version,
  $package        = $elasticsearch2::params::package,

  $cluster        = $elasticsearch2::params::cluster,
  $user           = $elasticsearch2::params::user,
  $configdir      = $elasticsearch2::params::configdir,
  $datadir        = $elasticsearch2::params::datadir,
  $executable     = $elasticsearch2::params::executable,
  $logdir         = $elasticsearch2::params::logdir,
  $host           = $elasticsearch2::params::host,
  $http_port      = $elasticsearch2::params::http_port,
  $transport_port = $elasticsearch2::params::transport_port,

  $enable         = $elasticsearch2::params::enable,
) inherits elasticsearch2::params {

  include java

  class { 'elasticsearch2::package':
    ensure  => $ensure,

    version => $version,
    package => $package,

    notify  => Service['elasticsearch2']
  }

  ~>
  class { 'elasticsearch2::config':
    ensure         => $ensure,

    cluster        => $cluster,
    user           => $user,
    configdir      => $configdir,
    datadir        => $datadir,
    executable     => $executable,
    logdir         => $logdir,
    host           => $host,
    http_port      => $http_port,
    transport_port => $transport_port,

    notify         => Service['elasticsearch2'],
  }

  ~>
  class { 'elasticsearch2::service':
    ensure => $ensure,

    enable => $enable,
  }

}
