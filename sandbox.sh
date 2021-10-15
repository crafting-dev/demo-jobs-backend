#!/bin/bash

# ============================================
# Configure sandbox for quick workspace setup.
# ============================================

# Install libgmp3
sudo apt-get install libgmp3-dev -y

# Install mysql client
sudo apt-get install mysql-client libmysqlclient-dev -y

# Update system
sudo apt-get update

# Install rails
gem install rails