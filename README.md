This is no longer needed as [Vagrant allows you][1] to specify `run: "always"` on a provisioner.
Which will cause it to run on every `vagrant up` or `vagrant reload`. 

[1]:http://docs.vagrantup.com/v2/provisioning/basic_usage.html
