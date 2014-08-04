Chef Operator install 
=======

To operate chef-client, you need to install knife on your local machine:

    curl -sSL https://get.rvm.io | bash -s stable
    rvm install 2.1.2
    rvm 2.1.2@chef --create
    rvm use 2.1.2@chef
    bundle install

Chef Client install
===================

The "official" way to do this is to run:

    knife solo prepare client.domainname

Chef client package comes with an isolated and buggy environment. This does not make it possible to install `pg` gem for example.
Also, a newer version of rubygems is necessary to use specific\_install.

    ssh client.domainname
    sudo apt-get update
    sudo apt-get install ruby1.9.1 ruby1.9.1-dev libpq-dev
    sudo REALLY_GEM_UPDATE_SYSTEM=true gem update --system
    sudo gem install chef

Deploy to client
================

    knife solo cook client.domainname

