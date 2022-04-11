#### Use latest Ubuntu
FROM ubuntu:20.04

# Update base container install
#RUN add-apt-repository ppa:ubuntugis/ppa
RUN apt-get update

ENV TZ 'IT'
RUN echo $TZ > /etc/timezone && \
    apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# Install GDAL dependencies

RUN apt-get install -y python3-pip gdal-bin libgdal-dev locales
RUN apt-get install -y python3-numpy 

# Ensure locales configured correctly
RUN locale-gen it_IT.UTF-8
ENV LC_ALL='it_IT.utf8'

# Set python aliases for python3
RUN echo 'alias python=python3' >> ~/.bashrc
RUN echo 'alias pip=pip3' >> ~/.bashrc

# Update C env vars so compiler can find gdal
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# This will install GDAL
RUN pip install GDAL

