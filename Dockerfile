FROM rocker/verse:latest

# commands taken from LightGBM Dockerfiles
# https://github.com/microsoft/LightGBM/blob/master/docker/dockerfile-python
# https://github.com/microsoft/LightGBM/blob/master/docker/dockerfile-cli

WORKDIR /lgbm

# Python
RUN apt-get update && \
    # packages cmake gcc g++ git wget already in base images
    apt-get install -y build-essential && \
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash Miniconda3-latest-Linux-x86_64.sh -f -b -p /opt/conda && \
    export PATH="/opt/conda/bin:$PATH" && \
    conda install -y numpy scipy scikit-learn pandas && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    conda clean -i -l -t -y && \
    rm -rf /usr/local/src

ENV PATH /opt/conda/bin:$PATH

RUN git clone --recursive --branch stable https://github.com/Microsoft/LightGBM

# LightGBM CLI
WORKDIR /lgbm/LightGBM/build
RUN cmake .. && \
    make -j4 && \
    make install

# LightGBM Python library
WORKDIR /lgbm/LightGBM/python-package/
RUN python setup.py install

# LightGBM R package
WORKDIR /lgbm/LightGBM/
RUN Rscript build_r.R

WORKDIR /

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="LightGBM on Rocker" \
        org.label-schema.description="All LightGBM libraries in a Rocker image for easy use in R" \
        org.label-schema.url="https://github.com/nuest/rocker-lightgbm" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/nuest/rocker-lightgbm" \
        org.label-schema.vendor="Daniel Nüst, Rocker.org, Microsoft" \
        #org.label-schema.version=$VERSION \
        org.label-schema.schema-version="1.0"

# build:
# docker build --tag rocker-lightgbm .
# run:
# docker run --rm -it rocker-lightgbm /bin/bash
# docker run --rm -it rocker-lightgbm R
