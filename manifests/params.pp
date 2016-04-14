# Internal: Configure elasticsearch.

class elasticsearch2::params {

  case $::osfamily {
    Darwin: {
      include boxen::config

      $ensure         = 'present'

      $version        = '2.2.2-boxen1'
      $package        = 'boxen/brews/elasticsearch2'

      $cluster        = "elasticsearch2_boxen_${::boxen_user}"
      $user           = $::boxen_user
      $configdir      = "${boxen::config::configdir}/elasticsearch2"
      $datadir        = "${boxen::config::datadir}/elasticsearch2"
      $executable     = "${boxen::config::homebrewdir}/elasticsearch2/2.2.2-boxen1/bin/elasticsearch"
      $logdir         = "${boxen::config::logdir}/elasticsearch2"

      $host           = '127.0.0.1'
      $http_port      = 19200
      $transport_port = 19300

      $enable         = true
    }

    default: {
      fail("Unsupported operating system: ${::osfamily}")
    }
  }

}
