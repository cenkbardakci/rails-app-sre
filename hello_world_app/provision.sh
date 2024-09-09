#!/bin/bash

# Install Ruby, PostgreSQL, Redis, and Rails dependencies
sudo yum update -y
sudo amazon-linux-extras install -y ruby3.0
sudo yum install -y postgresql-server postgresql-devel redis nodejs yarn

# Initialize PostgreSQL
sudo postgresql-setup initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Start Redis
sudo systemctl start redis
sudo systemctl enable redis

# Set up Rails application
bundle install
rails db:create db:migrate

# Install and configure Prometheus and Grafana
sudo yum install -y prometheus grafana
sudo systemctl start prometheus
sudo systemctl enable prometheus

sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Configure Prometheus
sudo cp ./monitoring/prometheus.yml /etc/prometheus/prometheus.yml
sudo systemctl restart prometheus

# Configure Grafana
sudo cp ./monitoring/grafana_dashboard.json /var/lib/grafana/dashboards/
