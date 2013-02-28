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
    cwd     => "/var/tmp",
    unless  => "test -e ${princexml::params::filename}"
  }

  -> exec{"princexml::decompress":
    command => "tar xvfz ${princexml::params::filename}",
    cwd     => "/var/tmp",
    unless  => "test -e ${princexml::params::folder}"
  }

  -> file{"/var/tmp/${princexml::params::folder}/install.sh":
    content => template("princexml/install.sh.erb"),
    mode    => 755
  }
}

class princexml::install{
  exec{"princexml::install":
    command => "/var/tmp/$princexml::params::folder/install.sh",
    unless  => "test -e /usr/local/bin/prince"
  }
}