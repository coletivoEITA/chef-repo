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

Chef client package comes with an isolated and buggy environment. This does not make it possible to install `pg` gem for example.
Also, a newer version of rubygems is necessary to use specific\_install.

    ssh client.domainname
    sudo apt-get update
    sudo apt-get install ruby1.9.1 ruby1.9.1-dev libpq-dev
    sudo REALLY_GEM_UPDATE_SYSTEM=true gem update --system
    sudo gem install chef

Deploy to client
================

First of all, BE SURE your repository is up-to-date:

    git pull
    git submodule update --init --recursive

Then, run -W to see what changes are going to be done
    knife solo -W cook client.domainname

And finally, carefully watch:
    knife solo cook client.domainname

