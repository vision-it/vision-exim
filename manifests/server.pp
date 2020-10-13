# Class: vision_exim::server
# ===========================
#
# Parameters
# ----------
#
# @param smarthost Which mailserver to use
# @param relay_nets From what clients to accept mails
#

class vision_exim::server (

  String $smarthost,
  String $relay_nets,

) {

  package { 'exim4':
    ensure => present,
  }

  file { '/etc/exim4/update-exim4.conf.conf':
    ensure  => present,
    content => template('vision_exim/exim4-server.conf.erb'),
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
