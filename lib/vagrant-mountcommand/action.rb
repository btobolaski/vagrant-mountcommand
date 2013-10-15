module VagrantPlugins
  module MountCommand
    module Action
      class Command
        def initialize(app, env)
          @app = app
          @env = env
        end

        def call(env)
          @app.call(env)
          @env = env

          @machine = env[:machine]

          unless mount_commands.empty?
            mount_command
          else
            @env[:ui].info I18n.t('vagrant_mountcommand.error.commands_not_found')
          end
        end

        def mount_commands
          @machine.config.mount_commands.commands
        end

        def mount_command
          mount_commands.each do |command|
            @machine.communicate.sudo(command)
          end
        end
      end
    end
  end
end
