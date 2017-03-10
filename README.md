# Ubuntu Upgrade Docker Containers

App containers to evaluate an upgrade path between Ubuntu releases.

## Development

```
cd $series
docker build -t uupgrade-$series .
docker run -e APT_PROXY=http://my.squid-deb.proxy:8888 -e APT_PACKAGES="many many packages" uupgrade-$series
```
