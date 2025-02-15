# MySQL - Restoring DB

This Ansible Role is used for restore MySQL Database from file in remote server.
<br>
<br>

[![Terraform Version](https://img.shields.io/badge/ansible-7.14.3%20+-623CE4.svg?logo=ansible)](https://github.com/ansible/ansible)
[![Owner](https://img.shields.io/badge/Developed%20by-https://www.phconsultoria.com.br-blue)](https://www.phconsultoria.com.br)<br>

Requirements
------------

- ansible >= 2.14.3
- MySQLdb (Python 2.x)
- PyMySQL (Python 2.7 and Python 3.X), or
- mysql (command line binary)
- mysqldump (command line binary)


## Role Variables

Set variables in vars/main.yml file:

dir_backups: Directory for stored backups files in remote server
time: Variable with date time for your backup which you wish restore. This variable has seted in runtime. Example:

```
  --extra-vars time=20230419 (YYYYMMDD)
```

dbname: Set db name for restore.   This variable has seted in runtime. Example:

```
  --extra-vars dbname=ansible
```

## Example Playbook

- name: Main Playbook
  hosts: all
  roles:
    - mysql-restoredb


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
