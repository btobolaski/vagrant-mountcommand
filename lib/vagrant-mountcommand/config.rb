module VagrantPlugins
  module MountCommand
    class Config < Vagrant.plugin('2', :config)

      def initialize
        @__mount_commands = []
      end

      def commands
        @__mount_commands
      end

      def command(command_to_run)
        @__mount_commands.push command_to_run
      end

      def merge(other)
        @__mount_commands.concat(other.instance_variable_get(:@__mount_commands))
      end
    end
  end
end
