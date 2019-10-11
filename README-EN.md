[![Open Source Helpers](https://www.codetriage.com/juuh42dias/transervicos/badges/users.svg)](https://www.codetriage.com/juuh42dias/transervicos)

Version in [PORTUGUESE](https://github.com/juuh42dias/transervicos/blob/master/README.md)

# Transerviços
This is an Rails 5.2.x application.

# Documentation

This README describes the goal of this repository and how configure the developer environment. There also other documentation sources as follow:

##  Pre conditions:
### Requirements:

**Ruby 2.6.4**, preferably managed using [Rbenv](https://github.com/rbenv/rbenv)  
[PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres) must be installed and accept connections.

If you need help to configure tan Ruby developer environment, consult this Rails OS X installation guide.

# Getting Started
**bin/setup**  
Execute the bin/setup script. This script will:  

* Verify if the necessary Ruby version was installed
* Install the gems using the Bundler
* Create local copies of .env and database.yml
* Create, migrate and propagate/fill the database
* Run!
* Run the bin/rake test to guarantee that everything is working fine.  
* Run bin/rake test: system to execute every system tests.  
* Run bin/rails  
