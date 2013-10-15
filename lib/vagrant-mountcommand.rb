begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant mount-command plugin must be run within Vagrant"
end

require "vagrant-mountcommand/plugin"
require "vagrant-mountcommand/version"
require "vagrant-mountcommand/errors"

module VagrantPlugins
  module MountCommand
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end

    I18n.load_path << File.expand_path('locales/en.yml', source_root)
    I18n.reload!
  end
end
