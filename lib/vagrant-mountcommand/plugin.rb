module VagrantPlugins
  module MountCommand
    class Plugin < Vagrant.plugin("2")
      name "Mount-Command"
      description <<-DESC
      This plugin gives you the ability to run a command after vagrant mounts
      your shared directories
      DESC

      config(:mount_command) do
        require_relative 'config'
        Config
      end

      require_relative 'action'
      %w{up reload}.each do |action|
        action_hook(:MountCommand, "machine_action_#{action}".to_sym) do |hook|
          hook.after(Vagrant::Action::Builtin::NFS, Action::Command)
        end
      end
    end
  end
end
