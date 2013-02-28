class pygments_rb{
  class{"pygments_rb::dependencies":}
  -> class{"pygments_rb::packages":}
}

class pygments_rb::dependencies{
  if ! defined(Package['build-essential'])    { package { 'build-essential': ensure => installed } }
}

class pygments_rb::packages{
  package{"python-pygments": }
  -> package{"pygments.rb": provider => "gem"}
}