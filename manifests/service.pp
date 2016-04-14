# Internal: Manages the elasticsearch service
#
class elasticsearch2::service(
  $ensure = $elasticsearch2::params::ensure,
  $enable = $elasticsearch2::params::enable,
) inherits elasticsearch2::params {

  $service_ensure = $ensure ? {
    present => running,
    default => stopped,
  }

  service { 'com.boxen.elasticsearch2':
    ensure => stopped,
    enable => false,
  }

  ->
  service { 'dev.elasticsearch2':
    ensure => $service_ensure,
    enable => $enable,
    alias  => 'elasticsearch2',
  }

}
