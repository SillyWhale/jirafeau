# Docker Jirafeau

Docker image builded from the excellent [Jirafeau software](https://jirafeau.net) developped [by Mojo42](https://gitlab.com/mojo42/Jirafeau).

## Folders
- Uploads : Your data must be mapped into **/jirafeau-data**
- Config : Your jirafeau configuration must be mapped into **/Jirafeau/lib/config.local.php**

## Run container
### Docker Compose
You could use provided docker-compose.yml file by directly run command :
```bash
docker-compose up
```

### Direct run
You could run container by the following command :
```bash
docker run -d --name jirafeau -v /jirafeau-data/uploads:/jirafeau-data -v /jirafeau-data/config.local.php:/Jirafeau/lib/config.local.php -p 80:80 docker.fricouv.eu/vfricou/jirafeau:latest
```



# Supported tags and respective `Dockerfile` links

- [`latest` (*latest/Dockerfile*)](https://github.com/SillyWhale/jirafeau/blob/master/Dockerfile)

# Quick reference

- **Where to file issues**:  
  [https://github.com/SillyWhale/jirafeau/issues](https://github.com/SillyWhale/jirafeau/issues)

- **Maintained by**:  
  [SillyWhale](https://github.com/SillyWhale/jirafeau)

- **Source of this description**:  
  [docs repo's directory](https://github.com/SillyWhale/images-doc)

- **Supported Docker versions**:  
  [the latest release](https://github.com/docker/docker-ce/releases/latest)

# What is Jirafeau ?

[Jirafeau](https://gitlab.com/mojo42/Jirafeau) description.  

# How to use this image

## Usage

Use like you would any other base image:

```bash
docker run -d \
        -p 80:80
        -v ${PWD}/data/uploads:/jirafeau-data
        -v ${PWD}/data/config.local.php:/Jirafeau/lib/config.local.php
        sillywhale/jirafeau:latest
```

or via docker-compose :

```bash
docker-compose up -d
```

This yields us a virtual image size of about 60MB image.

## Documentation

This image is well documented. [Check out the documentation](http://docs.sillywhale.wtf/jirafeau/).

# License

View [license information](https://gitlab.com/mojo42/Jirafeau/blob/master/LICENSE.txt) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.