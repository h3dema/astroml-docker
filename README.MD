# Introduction

This repository creates a docker container that allows the students to follow the Lectures on "Big Data Sets in Astronomy" by Zeljko Ivezic at Sao Paulo School of Advanced Science on Learning from Data, July 31 - Aug 2, 2019



# Requisites

To run the docker container in Ubuntu, you just need the docker package installed, which can be done using _apt-get_ command as shown below:

```
sudo apt-get -y install docker.io
sudo groupadd docker
sudo usermod -aG docker $USER
```

Then you have to log out and log back in so that your group membership is re-evaluated. If you are more proficient, you can use other stuff link __newgrp__, but I recommend log out/in procedure because it is easier.

__For more information about to the Docker installation, please refer to the [docker documentation](https://docs.docker.com/install/).__


# Build the docker

To use the container, you first need to build it.
This process downloads and compiles all necessary modules and packages, ... and it can take some time!

Type the one of the following blocks of command:

1) cloning this repository

```
git clone https://github.com/h3dema/astroml-docker.git
cd astroml-docker
docker build -t h3dema/astroml .
```

This copy this repository to your computer, and then compile the Dockerfile that I provided.

2) From GitHub

```
docker build github.com/h3dema/astroml-docker -t h3dema/astroml
```

This does not need to download the repository, because __docker__ can access github directly. I prefer this method.


# To run

After the build you can run the container and run applications in it.

```
docker run -p 8888:8888 -v "$(pwd)":/root/local --net host -it h3dema/astroml
```

When you run the previous command, another prompt is open -- now inside the container.
You will be logged as root. The directory _/root/local_ inside the docker, is mapped (think of it as a symbolic link) to the directory (PWD) that you ran the __docker run__ command above.
To run the jupyter notebooks of the course, run the following commands to download the course files in root home directory.
Notice that these lines will download the course to the directory in the host computer, accessible by the container.
This is important because when you close the container, all data is lost.
So do not leave data you want to persist in the container, always use _/root/local_.

```
cd root/local
git clone https://github.com/dirac-institute/SPSAS2019.git
cd SPSAS2019
j
```

Then you can open the notebooks in the host computer.
To open the browser, type the command shown in a line similar to the lines below.
You can copy and paste the URL in your host web browser, and it will connect to the environment inside the container.

`
Or copy and paste one of these URLs:
        http://localhost:8888/?token=6cce160311ab5c41bbb70d61c525bf9fc685e166f67381ea
`

Notice that if you used the same commands as I, you just need to click in the link that shows in the container's console.
