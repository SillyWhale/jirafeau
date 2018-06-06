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