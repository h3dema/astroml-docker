# Introduction


# Requisites

To run the docker container in Ubuntu, you just need the docker package installed, which can be done using>

```
sudo apt-get -y install docker.io
sudo groupadd docker
sudo usermod -aG docker $USER
```

Then you havve to log out and log back in so that your group membership is re-evaluated.



# Build the docker

To use the container, you first need to build it.
This process downloads and compiles all modules and packages necessary, and it can take some time.

Cd to the directory where the dockerfile is, and type the following command:

```
docker build -t h3dema/astroml .
```


# To run

After the build you can run the container and run applications in it.


```
docker run -p 8888:8888 -v "$(pwd)":/root/local -it h3dema/astroml
```

