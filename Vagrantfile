VHM_BOX_NAME = ENV["VHM_BOX_NAME"].nil? ? "vagrant-haskell-minimal" : ENV["VHM_BOX_NAME"].downcase
VHM_ENV_NAME = ENV["VHM_ENV_NAME"].nil? ? "dev" : ENV["VHM_ENV_NAME"].downcase
VHM_MEMORY   = ENV["VHM_MEMORY"].nil?   ? 4096 : ENV["VHM_MEMORY"]
VHM_NUM_CPUS = ENV["VHM_NUM_CPUS"].nil? ? 4 : ENV["VHM_NUM_CPUS"]

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.synced_folder "./", "/vagrant"

    config.vm.define "#{VHM_BOX_NAME}-#{VHM_ENV_NAME}", primary: true do |b|
        b.vm.provider :virtualbox do |virtualbox, override|
           virtualbox.name = "#{VHM_BOX_NAME}"
           virtualbox.memory = "#{VHM_MEMORY}".to_i
           virtualbox.cpus = "#{VHM_NUM_CPUS}".to_i

           override.vm.hostname = "#{VHM_BOX_NAME}"
           override.vm.provision :shell, :path => "provision.sh"
        end
    end
end
