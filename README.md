# xamarin-android build on archlinux (with docker)

## Prerequisites

The solution presented here to install xamarin-android make use of docker
```
pacman -Syu docker
``̀ 

## Installing

From with the git root repository (where the Dockerfile file lies)
```
docker build -t xamarin-android .
```

or
```
docker build --build-arg=$(id -u) -t xa-build .
```

Then,

```
docker run -it --rm -v /path/to/some/dir/with/lots/of/space:/home/builduser xa-build
```

