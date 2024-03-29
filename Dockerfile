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

RUN apt-get -y install build-essential git wget apt-utils

# need pip to install modules
RUN apt-get -y install python-pip

# python modules
RUN python -m pip install numpy scipy
RUN python -m pip install matplotlib
RUN python -m pip install sklearn
RUN python -m pip install jupyter

# dependencies for some code in astroML
RUN apt-get -y install gfortran-7

# tzdata
RUN export DEBIAN_FRONTEND=noninteractive && \
    ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata


# need for many figures/graphs
# RUN apt-get -y install texlive-full
RUN apt-get -y install texlive-latex-recommended texlive-latex-extra texlive-latex-base latex-cjk-common latex-cjk-all

# install astroML
RUN python -m pip install astroml

EXPOSE 8888

# directory in the container to map the PWD directory in the host computer
RUN mkdir -p /root/local

# create some alias
# 1) just type "j" to run the jupyter notebook
RUN echo "alias j=\"jupyter notebook --allow-root\"" >> /root/.bashrc

WORKDIR /root/local
