# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name              = "vagrant-mountcommand"
  s.version           = "0.0.1"
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Brendan Tobolaski"]
  s.email             = ["brendan@tobolaski.com"]
  s.homepage          = "https://github.com/btobolaski/vagrant-mountcommand"
  s.summary           = %q{Runs a command after all of vagrant's share mounts have been mounted}
  s.description       = %q{a vagrant plugin to run a command after vagrant mounts all of the shares, every time the vm boots}
  s.license           = 'MIT'

  s.rubyforge_project = "vagrant-mountcommand"

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths     = ["lib"]
end
