class princexml{
  class{"princexml::params":}
   -> class{"princexml::dependencies":}
   -> class{"princexml::download":}
   -> class{"princexml::install":}
}

class princexml::dependencies{
  package{"wget":}
}

class princexml::download{
  exec{"princexml::download":
    command => "wget ${princexml::params::url}",
    cwd     => "/tmp",
    unless  => "test -e /tmp/${princexml::params::filename}"
  }
}

class princexml::install{

}