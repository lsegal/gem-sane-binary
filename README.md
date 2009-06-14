gem-sane-binary
===============

MIT License &copy; 2009 by Loren Segal

SYNOPSIS
--------

Right now RubyGems rewrites the shebang for the binaries (executables) it 
generates in a gem using the current Ruby executable name, which inadvertently 
causes the binary to be tied to the specific Ruby version. This means you need 
to reinstall a gem everytime you switch Ruby interpreters to regenerate the 
binaries.

This gem adds a RubyGems plugin to change the shebang behaviour to use a `ruby` 
symlink if one is available in the same directory as the Ruby interpreter being 
used. This allows you to symlink `ruby` to whichever current Ruby interpreter 
is being used, making it easier for 1.8/1.9 to co-exist on a system.

INSTALL
-------

    $ gem install gem-sane-binary
   
USING
-----

To use the gem, you just need to have a `ruby` symlink pointing to your correct
Ruby interpreter in the same directory as the interpreter that gem uses when
installing your gems.

SETTING UP RUBY 1.8 AND RUBY 1.9
--------------------------------

If you don't already have two Ruby installs, you should probably read bellow
to get setup, otherwise this gem won't be very helpful to you.

This gem works best for Ruby 1.8/1.9 compatibility. If you want to install Ruby
1.8 and Ruby 1.9 side by side, recompile Ruby 1.9 with:
  
    ruby-1.9.1...$ ./configure --program-suffix=19
    
You'll then want to rename any ruby 1.8 binaries to use their suffix names as
well (I'm assuming you already have 1.8 installed. If not, install 1.8 with
a suffix as well and skip this step):

    $ sudo mv /usr/local/bin/ruby /usr/local/bin/ruby18
    $ sudo mv /usr/local/bin/irb /usr/local/bin/irb18
    $ sudo mv /usr/local/bin/gem /usr/local/bin/gem18
    
Then create your ruby/irb/gem symlinks to point to whichever Ruby install you're
using:

    $ ln -fs /usr/local/bin/ruby19 /usr/local/bin/ruby
    $ ...
    
I use the following aliases in my `~/.profile` to switch between Ruby installs:

    alias ruby-switch-18='sudo ln -fs /usr/local/bin/ruby18 /usr/local/bin/ruby &&
      sudo ln -fs /usr/local/bin/irb18 /usr/local/bin/irb &&
      sudo ln -fs /usr/local/bin/gem18 /usr/local/bin/gem'
    alias ruby-switch-19='sudo ln -fs /usr/local/bin/ruby19 /usr/local/bin/ruby &&
      sudo ln -fs /usr/local/bin/irb19 /usr/local/bin/irb &&
      sudo ln -fs /usr/local/bin/gem19 /usr/local/bin/gem'

Then I get:

      ~$ ruby-switch-18 && ruby --version 
      ruby 1.8.7 (2009-01-28 patchlevel 99) [i686-darwin9.6.0]
      ~$ ruby-switch-19 && ruby --version
      ruby 1.9.1p0 (2009-01-30 revision 21907) [i386-darwin9.6.0]
