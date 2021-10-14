#!/bin/bash

install_rvm() {
  # Install GPG
  sudo apt-get install gnupg2 -y

  # Install GPG keys used to verify installation package
  gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

  # Install rvm
  \curl -sSL https://get.rvm.io | bash

  # Use rvm in current open shell
  source /home/owner/.rvm/scripts/rvm
}

install_latest_ruby() {
  # Use rvm to install latest ruby
  rvm install ruby
}

install_latest_rails() {
  gem install rails
}

install_mysql_client() {
  sudo apt-get install mysql-client libmysqlclient-dev -y
}

update_all() {
    sudo apt-get update
}


# Run and setup workspace
install_rvm
install_latest_ruby
install_latest_rails
install_mysql_client
update_all

bash -l