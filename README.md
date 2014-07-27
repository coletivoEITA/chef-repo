Chef Operator install 
=======

To operate chef-client, you need to install knife on your local machine:

    rvm install 2.1.2
    rvm gemset 2.1.2@chef --create
    bundle install

Chef Client install
===================

The "official" way to do this is to run:

    knife solo prepare client.domainname

Chef client package comes with an isolated and buggy environment. This does not make it possible to install `pg` gem for example.
Also, a newer version of rubygems/ruby is necessary to use specific\_install.

    ssh client.domainname
    sudo add-apt-repository ppa:brightbox/ruby-ng
    sudo apt-get update
    sudo apt-get install ruby2.1 ruby2.1-dev
    sudo gem install chef

Deploy to client
================

    knife solo cook client.domainname

