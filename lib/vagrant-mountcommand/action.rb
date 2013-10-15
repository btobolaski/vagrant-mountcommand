module VagrantPlugins
  module MountCommand
    module Action
      class Command
        def call(env)
          @app.call(env)
          @env = env

          @machine = env[:machine]

          unless mount_commands.empty?
            mount_commands
          end
        end

        def mount_commands
          mount_commands.each do |command|
            @machine.communicate.sudo(command)
          end
        end
      end
    end
  end
end
