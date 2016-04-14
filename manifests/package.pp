# Internal: Manages the elasticsearch package
#
class elasticsearch2::package(
  $ensure  = $elasticsearch2::params::ensure,
  $version = $elasticsearch2::params::version,
  $package = $elasticsearch2::params::package,
) inherits elasticsearch2::params {

  $package_ensure = $ensure ? {
    present => $version,
    default => installed,
  }

  if $::operatingsystem == 'Darwin' {
    homebrew::formula { 'elasticsearch2': }
  }

  package { $package:
    ensure  => $package_ensure,
  }

}
