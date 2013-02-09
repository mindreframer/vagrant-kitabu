class princexml{
  class{"princexml::params":}
   -> class{"princexml::dependencies":}
   -> class{"princexml::download":}
   -> class{"princexml::install":}
}

class princexml::dependencies{
  if ! defined(Package['wget'])    { package { 'wget': ensure => installed } }
}

class princexml::download{
  exec{"princexml::download":
    command => "wget ${princexml::params::url}",
    cwd     => "/tmp",
    unless  => "test -e /tmp/${princexml::params::filename}"
  }

  -> exec{"princexml::decompress":
    command => "tar xvfz /tmp/${princexml::params::filename}",
    unless  => "test -e /tmp/${princexml::params::folder}"
  }

  -> file{"/tmp/${princexml::params::folder}/install.sh":
    content => template("princexml/install.sh.erb"),
    mode    => 755
  }
}

class princexml::install{
  exec{"princexml::install":
    command => "/tmp/$princexml::params::folder/install.sh",
    unless  => "test -e /usr/local/bin/prince"
  }
}