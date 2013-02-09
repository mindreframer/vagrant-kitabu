class pygments_rb{
  package{"python-pygments": }
  -> package{"pygments.rb": provider => "gem"}
}