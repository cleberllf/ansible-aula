# Ansible Aula

[![Ansible Version](https://img.shields.io/badge/Ansible-7.0%2B-red.svg)](https://docs.ansible.com/)
[![Python Version](https://img.shields.io/badge/Python-2.6%2B-blue.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-Multiple-yellow.svg)](#licença)

Este repositório contém exemplos, playbooks e roles para praticar e aprender Ansible, com foco em automação de infraestrutura e gerenciamento de configurações. Ele inclui exemplos de uso de variáveis, prompts, templates, condições e integração com serviços como AWS.

## Sumário

- [Ansible Aula](#ansible-aula)
  - [Sumário](#sumário)
  - [Estrutura do Repositório](#estrutura-do-repositório)
  - [Playbooks](#playbooks)
    - [Lista de Playbooks Disponíveis](#lista-de-playbooks-disponíveis)
  - [Inventário](#inventário)
  - [Roles](#roles)
    - [Roles Disponíveis](#roles-disponíveis)
  - [Exemplo de Uso](#exemplo-de-uso)
    - [Playbook com Variáveis](#playbook-com-variáveis)
    - [Role para EC2 na AWS](#role-para-ec2-na-aws)
  - [Requisitos](#requisitos)
    - [Requisitos Básicos](#requisitos-básicos)
    - [Dependências Específicas](#dependências-específicas)
    - [Configuração do Ambiente](#configuração-do-ambiente)
  - [Como Contribuir](#como-contribuir)
    - [Diretrizes de Contribuição](#diretrizes-de-contribuição)
  - [Licença](#licença)
  - [Autor](#autor)

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

Os playbooks estão localizados na pasta `playbooks/` e cobrem diversos tópicos fundamentais do Ansible. Cada playbook é nomeado de forma intuitiva e contém comentários explicativos sobre seu funcionamento.

### Lista de Playbooks Disponíveis

1. **Operações Básicas**
   - `01_UpdateLinux.yml`: Atualização de sistemas Linux
   - `02_Tags.yml`: Uso de tags para execução seletiva de tarefas

2. **Gerenciamento de Variáveis**
   - `03_Vars.yml`: Exemplos de definição e uso de variáveis
   - `04_VarsFiles.yml`: Uso de arquivos externos de variáveis
   - `05_VarsAnsibleFacts.yml`: Trabalhando com Ansible Facts
   - `06_VarsRunTime.yml`: Variáveis em tempo de execução
   - `07_VarsPrompt.yml`: Solicitação de entrada do usuário

3. **Registro e Manipulação de Dados**
   - `08_RegisterOutputs.yml`: Captura de saída de comandos
   - `09_RegisterFilters.yml`: Uso de filtros para manipulação de dados

4. **Controle de Fluxo**
   - `10_AnsibleConditionals.yml`: Condicionais básicas
   - `11_AnsibleConditionalsBool.yml`: Condicionais booleanas
   - `12_Blocks.yml`: Agrupamento de tarefas em blocos

5. **Loops e Iterações**
   - `14_Loop.yml`: Loops básicos
   - `15_LoopMultipleOptions.yml`: Múltiplas opções em loops
   - `16_LoopWithItems.yml`: Uso do with_items
   - `17_LoopControl.yml`: Controle avançado de loops
   - `18_LoopInner.yml`: Loops aninhados
   - `19_WithSequence.yml`: Sequências em loops

6. **Handlers e Roles**
   - `20_Handlers.yml`: Manipuladores de eventos
   - `21_IncludeRoles.yml`: Inclusão e uso de roles

## Inventário

O inventário está localizado na pasta `inventory/` e inclui arquivos como:

- **hosts.yml**: Define grupos de hosts e variáveis globais.
- **aws_yml**: Inventário para integração com AWS.

## Roles

As roles estão organizadas na pasta `roles/` e seguem as melhores práticas de estruturação do Ansible. Cada role é independente e pode ser reutilizada em diferentes projetos.

### Roles Disponíveis

1. **💻 AWS EC2 (`aws_ec2`)**
   - Criação e gerenciamento de instâncias EC2 na AWS
   - Configuração de security groups e network
   - Suporte a user-data para inicialização
   - Requer: `boto3` e credenciais AWS configuradas

2. **📦 Instalação de Pacotes (`install-packages`)**
   - Suporte para múltiplos gerenciadores de pacotes (apt, yum, dnf)
   - Instalação em lote de pacotes
   - Configuração de repositórios personalizados

3. **🔄 Atualização Linux (`linux-update`)**
   - Atualização de sistemas Debian/Ubuntu e RedHat/CentOS
   - Gerenciamento de cache de pacotes
   - Suporte a reinicialização controlada

4. **📁 Gerenciamento de Arquivos (`manage-files`)**
   - Criação e manipulação de arquivos e diretórios
   - Controle de permissões e propriedade
   - Compactação e descompactação de arquivos

5. **🗄️ MySQL Restore (`mysql-restoredb`)**
   - Restauração de backups do MySQL
   - Suporte a compressão de arquivos
   - Gerenciamento de usuários e privilégios

6. **🌐 Nginx (`nginx`)**
   - Instalação e configuração do Nginx
   - Gestão de virtual hosts
   - Configuração de SSL/TLS
   - Otimização de performance

7. **📋 Templates (`using-templates`)**
   - Geração dinâmica de configurações
   - Suporte a variáveis e condicionais
   - Templates Jinja2 reutilizáveis

Cada role inclui:
- Documentação detalhada no `README.md`
- Variáveis padrão em `defaults/main.yml`
- Testes em `tests/`
- Handlers e tasks bem organizados

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

### Requisitos Básicos

- **Ansible**: 7.0 ou superior
- **Python**: >= 2.6
- Sistema operacional Linux ou Unix-like

### Dependências Específicas

- `boto3` para roles AWS
- `pymysql` para roles MySQL
- `cryptography` para Ansible Vault

### Configuração do Ambiente

```bash
# Para Ubuntu/Debian
sudo apt update
sudo apt install ansible

# Para Red Hat/Oracle Linux/Alma Linux/Rocky Linux
sudo dnf update
sudo dnf install epel-release # Habilita o repositório EPEL
sudo dnf install ansible

# Para Fedora
sudo dnf update
sudo dnf install ansible

# Instalação das dependências Python (comum a todos os sistemas)
python3 -m pip install --user boto3 pymysql cryptography

# Verificação da instalação
ansible --version
```

**Nota**: Para sistemas baseados em Red Hat (RHEL, Oracle Linux, Alma Linux, Rocky Linux), o repositório EPEL (Extra Packages for Enterprise Linux) é necessário pois contém o pacote do Ansible e suas dependências.

## Como Contribuir

1. Faça um Fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add: nova feature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

### Diretrizes de Contribuição

- Mantenha o padrão de nomenclatura dos arquivos
- Documente todas as variáveis e dependências
- Adicione testes para novas funcionalidades
- Mantenha a compatibilidade com as versões suportadas

## Licença

Este repositório utiliza múltiplas licenças, dependendo da role. Consulte os arquivos `README.md` de cada role para mais detalhes.

## Autor

Este repositório foi desenvolvido por **Cleber Lima** como parte do curso *Ansible para SysAdmin* na Udemy.

---
⭐ Se este projeto foi útil para você, considere dar uma estrela!
