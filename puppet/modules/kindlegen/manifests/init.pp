class kindlegen{
  class{"kindlegen::params":}
    -> class{"kindlegen::dependencies":}
    -> class{"kindlegen::download":}
    -> class{"kindlegen::install":}
}

class kindlegen::dependencies{
  if ! defined(Package['wget'])    { package { 'wget': ensure => installed } }
}

class kindlegen::download{
  exec{"kindlegen::download":
    command => "wget ${kindlegen::params::url}",
    cwd     => "/tmp",
    unless  => "test -e /tmp/${kindlegen::params::filename}"
  }
  -> file{"/tmp/${kindlegen::params::folder}":
    ensure => directory
  }
  -> exec{"kindlegen::decompress":
    command => "tar xvfz /tmp/${kindlegen::params::filename}",
    cwd     => "/tmp/${kindlegen::params::folder}",
    unless  => "test -e /tmp/${kindlegen::params::folder}/kindlegen"
  }
}

class kindlegen::install{
  exec{"kindlegen::install":
    command => "cp /tmp/${kindlegen::params::folder}/kindlegen /usr/local/bin",
    unless  => "test -e /usr/local/bin/kindlegen"
  }
}