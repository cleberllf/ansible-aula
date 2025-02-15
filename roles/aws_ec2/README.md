# Creating new EC2 instance in AWS

This Ansible Role is used for create a new EC2 instance on AWS cloud provider.
<br>
<br>

[![Terraform Version](https://img.shields.io/badge/ansible-7.3.0%20+-623CE4.svg?logo=ansible)](https://github.com/ansible/ansible)
[![Owner](https://img.shields.io/badge/Developed%20by-https://www.phconsultoria.com.br-blue)](https://www.phconsultoria.com.br)<br>

Requirements
------------

- boto3
- python >= 2.6
- Configure AWS CLI: https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-configure.html
- AWS Resources created:
  - SSH Key
  - Security Group
  - VPC
  - Subnets


## Role Variables

Variables are available in vars directory. Read and change this. The required variables are:

- ssh_key:
- instance_type:
- vpc_subnet_id:
- image_id:
- region:
- tag_name:
- tag_ambiente:
- tag_owner:
- disk_size:

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

- name: Create EC2 Instance on AWS Cloud
  hosts: localhost
  connection: local
  collections:
    - amazon.aws
  roles:
    - aws_ec2
  vars_prompt:
    - name: aws_profile
      prompt: What is your AWS profile for authentication?
      private: false
    - name: count
      prompt: How many instances do you want to create?
      private: false


## License

[![License](https://img.shields.io/badge/License-Apache2.0-blue)](https://www.apache.org/licenses/LICENSE-2.0)

This module is licensed under the Apache License Version 2.0, January 2004.
Please see [LICENSE](LICENSE) for full details.

Copyright &copy; 2022  [pH Consultoria](https://www.phconsultoria.com.br)

## Author Information

Founded in 2015 and based in Belo Horizonte/Brazil, the pH Consultoria is specialized in AWS cloud environments, 
focused in Infrastructure, Security and Automations. We offer commercial support for all of our projects and encourage 
you to reach out if you have any questions or need help. Feel free to email us at 
contato@phconsultoria.com.br.<br>

We can also help you with:
* Consulting & training on AWS.
  * Security
  * Infrastructure
  * Automations (Infra as a Code, Configuration Management)
<br>
