# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "base"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :hostonly, "192.168.10.88"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  config.vm.customize ["modifyvm", :id, "--memory", 1024]

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "platforms-o1", "/data/disk/o1/static", "~/workspace/platforms-o1", :extra => "dmode=755,fmode=755,gid=1000,uid=1001"
  config.vm.share_folder "platforms-o2", "/data/disk/o2/static", "~/workspace/platforms-o2", :extra => "dmode=755,fmode=755,gid=1000,uid=1002"
  config.vm.share_folder "platforms-o3", "/data/disk/o3/static", "~/workspace/platforms-o3", :extra => "dmode=755,fmode=755,gid=1000,uid=1003"
  
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "barracuda"    
  end
end
