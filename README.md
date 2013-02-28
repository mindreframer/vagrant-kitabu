# Vagrant-kitabu

## Problem
Installing Kitabu to write ebooks involves some manual configuration. Let's automate it! )

This [Vagrant] script will install for you:

  - [Kitabu]
  - [HTML2Text]
  - [Kindlegen]
  - [Pygments.rb]
  - [PrinceXML]

Everything nicely packaged on a sandbox system, so you don't have to manually install anything on your precious system!

## How to use

    $ git clone git://github.com/mindreframer/vagrant-kitabu.git
    $ cd vagrant-kitabu
    $ vagrant up
    $ ... make a tea, while your digital Gutenberg Printing Press is getting ready...

    # login into your fresh VM
    $ vagrant ssh


    # check depencies
    $ kitabu check

      Prince XML: Converts HTML files into PDF files.
      Installed.

      KindleGen: Converts ePub e-books into .mobi files.
      Installed.

      html2text: Converts HTML documents into plain text.
      Installed.

      pygments.rb: A generic syntax highlight. If installed, replaces CodeRay.
      Installed.

    # now go to shared vagrant folder
    $ cd /vagrant
    # create a folder for your books
    $ mkdir ebooks
    $ cd ebooks

    # create the basic template
    $ kitabu new my-new-bestseller
      create  templates/html/layout.erb
      create  templates/html/layout.css
      create  templates/html/user.css
      create  templates/html/syntax.css
      create  templates/epub/cover.erb
      create  templates/epub/user.css
      create  templates/epub/page.erb
      create  templates/epub/cover.png
      create  text/01_Welcome.md
      create  config/kitabu.yml
      create  config/helper.rb
      create  output
      create  images
      create  code
      create  .gitignore
      create  output/.gitkeep
      create  images/.gitkeep
      create  code/.gitkeep
      create  Guardfile

    $ cd my-new-bestseller
    $ kitabu export
      ** e-book has been exported

    # now take a look on your HOST system!
    $ ls vagrant-kitabu/ebooks/my-new-bestseller/output
      my-new-bestseller.epub     my-new-bestseller.mobi     my-new-bestseller.pdf.html tmp
      my-new-bestseller.html     my-new-bestseller.pdf      my-new-bestseller.txt

    $ start writing! Good luck!


## Contribute

Patches and suggestions welcome.

## Issues

Please raise issues via the github issue tracker.

## License

Please see the [LICENSE](https://github.com/mindreframer/vagrant-kitabu/blob/master/LICENSE)
file.

[Kitabu]: https://github.com/fnando/kitabu
[HTML2Text]: https://github.com/aaronsw/html2text
[Kindlegen]: http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211
[Pygments.rb]: https://github.com/tmm1/pygments.rb
[PrinceXML]: http://princexml.com
[Vagrant]: http://vagrantup.com
[Puppet]: http://puppetlabs.com
