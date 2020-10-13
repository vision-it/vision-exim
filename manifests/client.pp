# Class: vision_exim::client
# ===========================
#
# Parameters
# ----------
#
# @param smarthost Which mailserver to use
#
class vision_exim::client (

  String $smarthost

) {

  package { 'exim4':
    ensure => present,
  }

  file { '/etc/exim4/update-exim4.conf.conf':
    ensure  => present,
    content => template('vision_exim/exim4-client.conf.erb'),
    require => Package['exim4'],
    notify  => Service['exim4'],
  }

  file { '/etc/mailname':
    ensure  => present,
    content => $::fqdn,
  }

  service { 'exim4':
    ensure  => running,
    require => Package['exim4'],
  }

}
