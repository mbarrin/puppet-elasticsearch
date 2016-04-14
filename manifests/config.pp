# Internal: Manages the elasticsearch configuration files
#

class elasticsearch2::config(
  $ensure         = $elasticsearch2::params::ensure,
  $cluster        = $elasticsearch2::params::cluster,
  $user           = $elasticsearch2::params::user,
  $configdir      = $elasticsearch2::params::configdir,
  $datadir        = $elasticsearch2::params::datadir,
  $executable     = $elasticsearch2::params::executable,
  $logdir         = $elasticsearch2::params::logdir,
  $host           = $elasticsearch2::params::host,
  $http_port      = $elasticsearch2::params::http_port,
  $transport_port = $elasticsearch2::params::transport_port,
) inherits elasticsearch2::params {

  $dir_ensure = $ensure ? {
    present => directory,
    default => absent,
  }

  File {
    ensure => $ensure,
    owner  => $user
  }

  file {
    [
      $configdir,
      $datadir,
      $logdir
    ]:
      ensure => $dir_ensure ;

    "${configdir}/elasticsearch.yml":
      content => template('elasticsearch2/elasticsearch.yml.erb') ;

    '/Library/LaunchDaemons/dev.elasticsearch2.plist':
      content => template('elasticsearch2/dev.elasticsearch.plist.erb'),
      group   => 'wheel',
      owner   => 'root' ;
  }

  if $::operatingsystem == 'Darwin' {
    boxen::env_script { 'elasticsearch2':
      ensure   => $ensure,
      content  => template('elasticsearch2/env.sh.erb'),
      priority => 'lower',
    }

    include boxen::config

    file { "${boxen::config::envdir}/elasticsearch2.sh":
      ensure => absent,
    }
  }
}
