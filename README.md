# Install Wordpress and Mysql and Adminer using Docker compose

## Required
* install [docker desktop](https://www.docker.com/)
- Make sure that docker compose is also installed. [Installation link](https://docs.docker.com/compose/install/)

### Check requirement installation

you can check that with this command
```bash
docker -v
docker compose -v
```

## How to install
First you need to build
```bash
docker compose build
```

If you are in the production environment, you can use the following command and the server will come up
```bash
docker compose up -d
```

If you are in the Doloop environment, you can use the following command to edit the program files at the same time
```bash
docker compose -f docker-compose.yaml -f docker-compose.dev.yaml up -d
```

Finally, you can do all the commands at once with the command below
```bash
docker compose -f docker-compose.yaml -f docker-compose.dev.yaml up -d --build
```

## Using
Since the wordpress program will come up after executing the above command, you can see the program in your system with the wordpress.local domain.
Just make sure that this domain is included in the host files of your operating system with IP 127.0.0.1, To do this, go to the following address in Windows and edit it
```bash
C:\Windows\System32\drivers\etc\hosts

add this record in file

127.0.0.1  wordpress.local 
```

## Manage database
Adminer is used to manage the database, which you can refer to the following address and use.
```bash
http://wordpress.local:8080/
```

You can connect to the database using the following information
```bash
server: wordpress_mysql_host
username: wordpress_user
password: secret
database: wordpress_db
```
Notice:This information is placed in the env file by default, which you can change for your program