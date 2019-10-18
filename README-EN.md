[![Open Source Helpers](https://www.codetriage.com/juuh42dias/transervicos/badges/users.svg)](https://www.codetriage.com/juuh42dias/transervicos)

Version in [PORTUGUESE](https://github.com/juuh42dias/transervicos/blob/master/README.md)

# Transerviços
This is a Rails 5.2.x application.

# Documentation

This README describes the goal of this repository and how to configure the development environment. There are also other documentation sources as follow:

##  Pre conditions:
### Requirements:

**Ruby 2.6.4**, preferably managed using [Rbenv](https://github.com/rbenv/rbenv)  
[PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres) must be installed and accepting connections.


**Docker and Docker Compose (optional)**

You can use [Docker](https://docs.docker.com/install/) and [Docker
Compose](https://docs.docker.com/compose/install/)
to run this project on development or test mode. 

If you need help to configure the Ruby development environment, consult this Rails OS X installation guide.

#
# Getting Started without Docker

**bin/setup**  
Execute the bin/setup script. This script will:  

* Verify if the necessary Ruby version is installed
* Install the gems using Bundler
* Create local copies of `.env` and `database.yml`
* Create, migrate and populate the database
* Run!
* Run the `bin/rake test` to guarantee that everything is working fine.  
* Run `bin/rake test:system` to execute every system tests.  
* Run `bin/rails`


# Gettint Started with Docker

After you have installed Docker and Docker Compose, run the commands below:

* `docker-compose build` to create the Docker Images
* `docker-compose run web bash` to open a `shell` inside the container with the
  application already setup


Within this `shell` you must setup the application database before running other
commands. To do so, run: `bin/setup`

To run the application, run:

`rails server -b 0.0.0.0`

# Testing

## PENDING
