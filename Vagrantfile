# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  # Rocky Linux 9
  "rocky" => {"memory" => "1024", "cpu" => "1", "clone" => "true", "ipA" => "250", "image" => "generic/rocky9"},
  # Debian 12
  "debian" => {"memory" => "1024", "cpu" => "1", "clone" => "true", "ipA" => "251", "image" => "generic/debian12"},
  # Windows Server 2016
  "winserver" => {"memory" => "2048", "cpu" => "2", "clone" => "true", "ipA" => "252", "image" => "mwrock/Windows2016"}
}

Vagrant.configure("2") do |config|
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "192.168.0.#{conf["ipA"]}"
      machine.vm.network "public_network", ip: "192.168.31.#{conf["ipA"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.linked_clone = conf["clone"]
      end
      machine.vm.provision "shell", inline: "sed -i 's/PasswordAuthentication\ no/PasswordAuthentication\ yes/' /etc/ssh/sshd_config", privileged: true
      machine.vm.synced_folder ".", "/vagrant", disabled: true
      if "#{name}" == "rocky"
        machine.vm.provision "shell", inline: "systemctl restart sshd", privileged: true
      elsif "#{name}" == "debian"
        machine.vm.provision "shell", inline: "systemctl restart sshd", privileged: true
        #machine.vm.provision "shell", inline: "service sshd restart", privileged: true
        #machine.vm.provision "shell", inline: "apt-get clean all && apt-get update", privileged: true
      else
        #machine.vm.provision "shell", inline: "yum clean all && yum check-update", privileged: true
        #machine.vm.provision "shell", path: "shell_script.sh"
      end
    end
  end
end