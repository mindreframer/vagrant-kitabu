class princexml{
  class{"princexml::params":}
   -> class{"princexml::dependencies":}
   -> class{"princexml::download":}
   -> class{"princexml::install":}
}

class princexml::dependencies{
  package{"wget":}
  # -> package{"libgif4":}
  # -> package{"libjpeg-turbo8":}
  # -> package{"libjpeg8":}
  # -> package{"libtiff4":}
}

class princexml::download{
  exec{"princexml::download":
    command => "wget ${princexml::params::url}",
    cwd     => "/tmp",
    unless  => "test -e /tmp/${princexml::params::filename}"
  }
}

class princexml::install{
  exec{"princexml::install":
    command => "dpkg -i /tmp/${princexml::params::filename}",
    unless  => "dpkg -l |grep princexml"
  }
}