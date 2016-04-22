## Installing Postgres in Vagrant

I decided to go wtih Vagrant and this image

https://atlas.hashicorp.com/lazygray/boxes/heroku-cedar-14/versions/1.0.6

I hadn't seen this option yet, but it may have been a better starting point

https://wiki.postgresql.org/wiki/PostgreSQL_For_Development_With_Vagrant

1. Install Vagrant

https://www.vagrantup.com/downloads.html

2. Install VirtualBox 

https://www.virtualbox.org/wiki/Downloads

3. Initialize the Vagrant image

``` vagrant init lazygray/heroku-cedar-14 ```

4. Edit the Vagrant file and add port forwarding for postgresql with this line

``` config.vm.network "forwarded_port", guest: 5432, host: 15432 ```

5. Start the image

``` vagrant up ```

The first time the download and install will take about 30 mins

## Setup a new database manually

The dbuser and password will be `postgres_db` 

```
vagrant ssh # log into the VM
sudo su - postgres # become the db system user
createdb -O postgres_db databaseName # create a database for the non-system user
PGUSER=postgres_db PGPASSWORD=postgres_db psql -h localhost perf-status # connect to that database 
```
You can connect to that database from the host with a connection string like postgresql://postgres_db:postgres_db@localhost:15432/databaseName
