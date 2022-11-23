## Install Mysql for docker

`docker pull mysql`

## Init DataBase

### With Cmd (latest mysql version)

`docker run --name foodapp -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD -d mysql`

### With cmd and docker-compose.yml file (recommended)

`docker compose up dev-db - d`

## Run app
`npm start`

### Role

#### Admim = 0

#### User = 1

#### Restaurant owner = 2

#### Shipper = 3
