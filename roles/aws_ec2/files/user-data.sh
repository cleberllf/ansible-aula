#!/bin/bash
sudo amazon-linux-extras install epel -y
sudo yum update -y
sudo yum install "@Development tools" bind-utils bc bzip2 curl elinks git htop lsof net-tools screen tcpdump unzip vim wget bash-completion tree -y

# Install and configure SSM Agent
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl restart amazon-ssm-agent

# Adjusting Localtime
sudo rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime