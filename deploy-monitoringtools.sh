#!/bin/sh
sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch 
echo -e "[elastic-7.x]\nname=Elastic repository for 7.x packages\nbaseurl=https://artifacts.elastic.co/packages/7.x/yum\ngpgcheck=1\ngpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch\nenabled=1\nautorefresh=1\ntype=rpm-md\n" | sudo tee -a /etc/yum.repos.d/elastic.repo > /dev/null
sudo yum install filebeat
sudo yum install metricbeat
sudo filebeat modules enable nginx
sudo metricbeat modules enable nginx
sudo metricbeat modules enable system
sudo metricbeat modules enable docker
sudo chkconfig --add filebeat
sudo chkconfig --add metricbeat
