Chef::Log.debug("Running barracuda recipe")

remote_file "/tmp/BOA.sh" do
  source "http://files.aegir.cc/BOA.sh.txt"
  mode 00755
end

execute "/tmp/BOA.sh" do
  creates "/usr/local/bin/boa"
end

execute "Run the BOA Installer o1" do
  command "boa in-stable local openamsri@gmail.com mini"
end

# execute "Run the BOA Installer o2" do
#  command "boa in-stable local lars@intraface.dk aegir.local o2 max"
# end

# execute "Run the BOA Installer o3" do
#  command "boa in-stable local lars@intraface.dk aegir.local o3 max"
# end

#(1..3).each do |boa_user|

user "o1" do
supports :manage_home => true
home "/data/disk/o1"
shell "/bin/bash"
end

directory "/data/disk/o1/.ssh" do
owner "o1"
group "users"
mode 00700
recursive true
end

execute "Add ssh key to user" do
command "ssh-keygen -b 4096 -t rsa -N \"\" -f /data/disk/o1/.ssh/id_rsa"
creates "/data/disk/o1/.ssh/id_rsa"
end

file "/data/disk/o1/.ssh/id_rsa" do
owner "o1"
group "users"
mode 00600
end

file "/data/disk/o1/.ssh/id_rsa.pub" do
owner "o1"
group "users"
mode 00600
end

# Only necessary as long as there is a but
#remote_file "/tmp/fix-remote-import-hostmaster-o1.patch" do
#source "https://raw.github.com/lsolesen/boa-vagrant/master/patches/fix-remote-import-hostmaster-o1.patch"
#mode 00755
#end

#execute "Apply Remote Import hostmaster patch" do
#cwd "/data/disk/o1/.drush/provision/remote_import"
#command "patch -p1 < /tmp/fix-remote-import-hostmaster-o1.patch"
#end

# end

execute "Run BOA Tool to fix permissions" do
  user "root"
  command "bash /var/xdrago/daily.sh"
end

# Rebuild VirtualBox Guest Additions
# http://vagrantup.com/v1/docs/troubleshooting.html
execute "Rebuild VirtualBox Guest Additions" do
  command "sudo /etc/init.d/vboxadd setup"
end
