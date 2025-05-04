# Ansible Aula

Este repositório contém exemplos, playbooks e roles para praticar e aprender Ansible, com foco em automação de infraestrutura e gerenciamento de configurações. Ele inclui exemplos de uso de variáveis, prompts, templates, condições e integração com serviços como AWS.

## Estrutura do Repositório

```plaintext
.
├── .gitignore
├── ansible.cfg
├── main.yml
├── main2.yml
├── notas
├── Vagrantfile
├── .vscode/
│   └── settings.json
├── group_vars/
│   ├── all
│   ├── debian
│   ├── linux
│   ├── redhat
│   └── windows
├── host_vars/
│   ├── debian12
│   └── rocky9
├── inventory/
│   ├── aws_yml
│   ├── hosts
│   └── hosts.yml
├── outros/
│   ├── .vimrc
│   ├── cadastro.yml
│   └── config
├── playbooks/
│   ├── 01_UpdateLinux.yml
│   ├── 02_Tags.yml
│   ├── 03_Vars.yml
│   ├── 04_VarsFiles.yml
│   ├── 05_VarsAnsibleFacts.yml
│   ├── 06_VarsRunTime.yml
│   ├── 07_VarsPrompt.yml
│   ├── 08_RegisterOutputs.yml
│   ├── 09_RegisterFilters.yml
│   ├── 10_AnsibleConditionals.yml
│   ├── 11_AnsibleConditionalsBool.yml
│   └── ...
└── roles/
    ├── aws_ec2/
    ├── install-packages/
    ├── linux-update/
    ├── manage-files/
    ├── mysql-restoredb/
    ├── nginx/
    └── using-templates/
```

## Playbooks

Os playbooks estão localizados na pasta `playbooks/` e cobrem diversos tópicos, como:

- **Uso de Variáveis**: Exemplos de definição e uso de variáveis em playbooks, como no `03_Vars.yml`.
- **Prompt de Variáveis**: Solicitação de entrada do usuário em tempo de execução, como no `07_VarsPrompt.yml`.
- **Condições e Filtros**: Uso de condições e filtros para controle de execução de tarefas.

## Inventário

O inventário está localizado na pasta `inventory/` e inclui arquivos como:

- **hosts.yml**: Define grupos de hosts e variáveis globais.
- **aws_yml**: Inventário para integração com AWS.

## Roles

As roles estão organizadas na pasta `roles/` e incluem:

- **aws_ec2**: Criação de instâncias EC2 na AWS.
- **install-packages**: Instalação de pacotes em sistemas Linux.
- **linux-update**: Atualização de sistemas Linux.
- **manage-files**: Gerenciamento de arquivos.
- **mysql-restoredb**: Restauração de bancos de dados MySQL.
- **nginx**: Configuração de servidores Nginx.
- **using-templates**: Uso de templates para geração de arquivos.

Cada role possui um `README.md` com detalhes sobre variáveis, dependências e exemplos de uso.

## Exemplo de Uso

### Playbook com Variáveis

```yaml
- name: Testando variáveis
  hosts: rocky9
  vars:
    message: "nova mensagem"
    packages:
      - htop
      - vim
  tasks:
    - name: DEBUG | {{ message }}
      ansible.builtin.debug:
        msg: "{{ message }}"

    - name: DNF | Install packages
      ansible.builtin.dnf:
        name: "{{ packages }}"
        state: latest
```

### Role para EC2 na AWS

```yaml
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
```

## Requisitos

- **Ansible**: 7.0 ou superior.
- **Python**: >= 2.6.
- Dependências específicas para roles, como `boto3` para integração com AWS.

## Licença

Este repositório utiliza múltiplas licenças, dependendo da role. Consulte os arquivos `README.md` de cada role para mais detalhes.

## Autor

Este repositório foi desenvolvido por **Cleber Lima** como parte do curso *Ansible para SysAdmin* na Udemy.