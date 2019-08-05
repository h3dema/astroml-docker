#
# Dockerfile created to build a container that runs
# all programs necessary to work with astroML
# This environment uses Python version 2.7
#
#
# Updated in 08/05/2019
# Author: Henrique Moura (henriquemoura@hotmail.com)
#
#
FROM ubuntu:18.04 as base

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install build-essential git wget

# need pip to install modules
RUN apt-get -y install python-pip

# dependencies for some code in astroML
RUN apt-get -y install gfortran-7
RUN apt-get -y install texlive-latex-recommended

# python modules
RUN python -m pip install numpy scipy
RUN python -m pip install matplotlib
RUN python -m pip install sklearn
RUN python -m pip install jupyter

# install astroML
RUN python -m pip install astroml

# directory in the container to map the PWD directory in the host computer
RUN mkdir -p /root/local

EXPOSE 8888

# download the course files
RUN git clone https://github.com/dirac-institute/SPSAS2019.git
