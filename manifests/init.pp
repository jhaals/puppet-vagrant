# Public: Installs Vagrant
#
# Usage:
#
#   include vagrant

class vagrant(
  $version = '1.7.4',
  $completion = false
) {
  validate_bool($completion)

  $ensure_pkg = $completion ? {
    true    => 'present',
    default => 'absent',
  }

  if $version >= '1.9.3' {
    $pkgurl = "https://releases.hashicorp.com/vagrant/${version}/vagrant_${version}_x86_64.dmg"
  } else {
    $pkgurl = "https://releases.hashicorp.com/vagrant/${version}/vagrant_${version}.dmg"
  }

  package { "Vagrant_${version}":
    ensure   => installed,
    source   => $pkgurl,
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure  => directory,
    require => Package["Vagrant_${version}"],
  }

  homebrew::tap { 'homebrew/completions': }

  package { 'vagrant-completion':
    ensure   => $ensure_pkg,
    provider => 'homebrew',
    require  => Homebrew::Tap['homebrew/completions'],
  }
}
