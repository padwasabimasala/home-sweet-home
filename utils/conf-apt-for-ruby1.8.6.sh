# This script update apt/preferences and apt/source.list to make apt install ruby 1.8.6
# inspired by article at link below
# http://panthersoftware.com/articles/view/6/ruby-on-rails-development-on-ubuntu-9-04-jaunty-using-ruby-1-8-6

echo "
# BEGIN RUBY 1.8.6 - http://panthersoftware.com/articles/view/6/ruby-on-rails-development-on-ubuntu-9-04-jaunty-using-ruby-1-8-6
Package: ruby
Pin: release a=hardy
Pin-Priority: 900

Package: ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: rdoc1.8
Pin: release a=hardy
Pin-Priority: 900

Package: ri1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libgtk2-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libdbd-sqlite3-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libopenssl-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libsqlite3-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: ruby1.8-dev
Pin: release a=hardy
Pin-Priority: 1001

Package: libdbi-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libatk1-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libpango1-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libatk1-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libgdk-pixbuf2-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libglib2-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libcairo-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: irb1.8
Pin: release a=hardy
Pin-Priority: 900

Package: libreadline-ruby1.8
Pin: release a=hardy
Pin-Priority: 900

Package: rails
Pin: release a=hardy
Pin-Priority: 900

Package: libncurses-ruby1.8
Pin: release a=hardy
Pin-Priority: 900
# END RUBY 1.8.6
" >> /etc/apt/preferences

echo "
# Added to install ruby 1.8.6 - http://programmers-blog.com/2009/06/08/ruby-1-8-6-in-ubuntu-9-04-64-minimal
deb http://gb.archive.ubuntu.com/ubuntu/ hardy restricted main multiverse universe  
deb-src http://gb.archive.ubuntu.com/ubuntu/ hardy restricted main multiverse universe 
" >> /etc/apt/sources.list

apt-get update
