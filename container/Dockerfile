# Copyright (c) 2021 Foundries.io
#
# SPDX-License-Identifier: BSD-3-Clause
#

# For testing in the LmP
# docker build --tag flutter_builder .
# docker run -it --rm --entrypoint /bin/bash flutter_builder
# docker run -it --rm -v /tmp:/tmp flutter_builder

FROM debian:bullseye-20211011-slim

LABEL maintainer="Raul Muñoz <raul@foundries.io>"

ENV DEBIAN_FRONTEND noninteractive

# Install Chromium
RUN apt-get update && \
    apt-get install -y --no-install-recommends git \
                                               unzip \
                                               python3 \
                                               pip \
                                               clang \
                                               cmake \
                                               ninja-build \
                                               pkg-config \
                                               vim \
                                               sudo \
                                               curl \
                                               libgtk-3-dev \
                                               ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN git clone -b demo https://github.com/munoz0raul/workspace-automation.git
WORKDIR /workspace-automation
RUN git checkout 434dfa89028dc67d467a569ddcd8e82500052bcb

RUN unzip engine_sdk.zip

RUN pip3 install pyyaml pycurl

RUN python3 flutter_workspace.py

WORKDIR /
RUN git clone https://github.com/munoz0raul/flutter-app.git

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

COPY start.sh /

ENTRYPOINT ["/start.sh"]
