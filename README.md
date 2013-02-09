# Vagrant-kitabu

## Problem
Installing Kitabu to write ebooks involves some manual configuration. Let's automate it! )


## How to use

This repository is really just a template; copy the relevant files into your
own project. Here's a breakdown of what's required:

* `Vagrantfile` with simple shell provisioner definition
* `shell/bootstrap.sh` - a simple shell provisioner to install and run Librarian-puppet and also Puppet
* `puppet/Puppetfile` - configuration describing what Puppet modules to install. See the
[Librarian-puppet](https://github.com/rodjek/librarian-puppet) project for details.
* `puppet/manifests/main.pp` - your main Puppet manifest.
* `puppet/.gitignore` - configured to ignore temporary directories and files created by Librarian-puppet.

## Contribute

Patches and suggestions welcome.

## Issues

Please raise issues via the github issue tracker.

## License

Please see the [LICENSE](https://github.com/mindreframer/vagrant-kitabu/blob/master/LICENSE)
file.


[Vagrant]: http://vagrantup.com
[Puppet]: http://puppetlabs.com
