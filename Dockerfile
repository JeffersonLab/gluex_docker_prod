#
# Dockerfile - docker build script for a standard GlueX sim-recon 
#              container image based on centos 7.
#
# original author: richard.t.jones at uconn.edu
# author: marki at jlab.org
# version: March 7, 2022
#
# usage: [as root] $ docker build -t gluex_prod:gxi-2.30 .
#

FROM centos:7.9.2009

ENV GXI_VERSION=2.30
ADD https://github.com/JeffersonLab/gluex_install/archive/${GXI_VERSION}.tar.gz /
RUN tar zxvf ${GXI_VERSION}.tar.gz
RUN gluex_install-${GXI_VERSION}/gluex_prereqs_centos_7.sh
RUN mkdir /cvmfs
RUN ln -s cvmfs/oasis.opensciencegrid.org/gluex/group /group
RUN mkdir /u
RUN ln -s ../group /u/group
# make the cvmfs filesystem visible inside the container
VOLUME /cvmfs/oasis.opensciencegrid.org
