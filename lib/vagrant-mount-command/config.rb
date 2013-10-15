module VagrantPlugins
  module MountCommand
    class Config < Vagrant.plugin('2', :config)

      def initialize
        @__default_command = {}
        @__mount_commands = []
      end

      def mount_command
        @__mount_commands
      end

      def mount_command(command)
        @__mount_commands.push command
      end

      def merge(other)
        @__mount_commands.concat(other.instance_variable_get(:@__mount_commands))
      end
    end
  end
end
