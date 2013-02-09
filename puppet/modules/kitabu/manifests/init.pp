class kitabu{
  class{"kitabu::dependencies":} ->
  class{"kitabu::packages":}
}

class kitabu::dependencies{
  package{"ruby1.9.3": ensure => installed}
}

class kitabu::packages{
  package{"kitabu": ensure => installed, provider => "gem"}
}