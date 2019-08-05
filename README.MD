# Introduction

This repository creates a docker container that allows the students to follow the Lectures on "Big Data Sets in Astronomy" by Zeljko Ivezic at Sao Paulo School of Advanced Science on Learning from Data, July 31 - Aug 2, 2019



# Requisites

To run the docker container in Ubuntu, you just need the docker package installed, which can be done using>

```
sudo apt-get -y install docker.io
sudo groupadd docker
sudo usermod -aG docker $USER
```

Then you havve to log out and log back in so that your group membership is re-evaluated.

__For more information about to the installation, please refer to the [docker documentation](https://docs.docker.com/install/).__


# Build the docker

To use the container, you first need to build it.
This process downloads and compiles all modules and packages necessary, and it can take some time.

Cd to the directory where the dockerfile is, and type the one of the following blocks of command:

1) cloning this repository

```
git clone https://github.com/h3dema/astroml-docker.git
cd astroml-docker
docker build -t h3dema/astroml .
```

2) From GitHub

```
docker build github.com/h3dema/astroml-docker -t h3dema/astroml
```


# To run

After the build you can run the container and run applications in it.


```
docker run -p 8888:8888 -v "$(pwd)":/root/local --net host -it h3dema/astroml
```

To run the jupyter notebooks of the course, run the following commands
to download the course files in root home directory.

```
cd root/local
git clone https://github.com/dirac-institute/SPSAS2019.git
cd SPSAS2019
j
```

Then you can open in the host computer, the browser and type the command shown in a line similar to the lines below. You can copy and paste the URL in your host web browser, and it will connect to the environment inside the container.

`
Or copy and paste one of these URLs:
        http://localhost:8888/?token=6cce160311ab5c41bbb70d61c525bf9fc685e166f67381ea
`
