#!/bin/bash
set -ex

apt update

apt -y install \
    cmake \
    extra-cmake-modules \
    git \
    libqt5svg5 \
    libqt5svg5-dev \
    libqt5waylandclient5-dev \
    libqt5x11extras5-dev \
    libwayland-dev \
    libxfixes-dev \
    libxtst-dev \
    qtbase5-private-dev \
    qtdeclarative5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    qtwayland5 \
    qtwayland5-dev-tools
