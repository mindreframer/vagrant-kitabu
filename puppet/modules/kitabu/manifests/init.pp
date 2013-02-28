class kitabu{
  class{"kitabu::dependencies":}
  -> class{"kitabu::packages":}
}

class kitabu::dependencies{
  if ! defined(Package['ruby1.9.3'])    { package { 'ruby1.9.3': ensure => installed } }
  if ! defined(Package['libxml2-dev'])  { package { 'libxml2-dev': ensure => installed } }
  if ! defined(Package['libxslt1-dev'])  { package { 'libxslt1-dev': ensure => installed } }
}

class kitabu::packages{
  package{"kitabu": ensure => installed, provider => "gem"}
}