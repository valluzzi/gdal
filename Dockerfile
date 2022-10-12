#### Use latest Osgeo/gdal image
#FROM osgeo/gdal:latest
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
#RUN apt-get install -y software-properties-common
#RUN add-apt-repository ppa:ubuntugis/ppa && apt-get update
RUN apt-get update
#EUN apt-get gdal-bin libgdal-dev==3.0.4
RUN apt-get install -y python3-pip python3-gdal gdal-bin locales

# Set python aliases for python3
RUN echo 'alias python=python3' >> ~/.bashrc
RUN echo 'alias pip=pip3' >> ~/.bashrc

#--------------------------------------------------------                                                    
#               Python GDAL
#--------------------------------------------------------
# Update C env vars so compiler can find gdal
#ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
#ENV C_INCLUDE_PATH=/usr/include/gdal

# This will install GDAL
ENV PROJ_LIB=/usr/share/proj
ENV GDAL_DATA=/usr/share/data
RUN pip install -U numpy
#RUN pip install GDAL==3.3.2