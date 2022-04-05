#### Use latest Ubuntu
FROM ubuntu/apache2:latest
#WORKDIR /home/vlr20/Projects/GitHub

# Update base container install
RUN apt-get update
#RUN apt-get upgrade -y

ENV TZ 'IT'
RUN echo $TZ > /etc/timezone && \
    apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# Install GDAL dependencies
RUN apt-get install -y python3-pip libgdal-dev locales git

# Ensure locales configured correctly
RUN locale-gen it_IT.UTF-8
ENV LC_ALL='it_IT.utf8'

# Set python aliases for python3
RUN echo 'alias python=python3' >> ~/.bashrc
RUN echo 'alias pip=pip3' >> ~/.bashrc

# Update C env vars so compiler can find gdal
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# This will install latest version of GDAL
RUN pip3 install numpy==1.20.3
RUN pip3 install GDAL==3.2.1

