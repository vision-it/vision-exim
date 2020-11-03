# Class: vision_exim::server
# ===========================
#
# Parameters
# ----------
#
# @param smarthost Which mailserver to use
# @param relay_nets From what clients to accept mails
# @param mail_alias Mail alias for root user
#

class vision_exim::server (

  String $smarthost,
  String $relay_nets,
  String $mail_alias,

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

  file { '/etc/email-addresses':
    ensure  => present,
    content => "root: ${mail_alias}",
  }

  file { '/etc/mailname':
    ensure  => present,
    content => $::domain,
  }

  service { 'exim4':
    ensure  => running,
    require => Package['exim4'],
  }

}
