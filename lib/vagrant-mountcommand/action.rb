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

          # Setup a sentinel to check whether the machine has already been provisioned.
          sentinel = env[:machine].data_dir.join("action_provision")
          run_mount_commands = true
          if sentinel.file?
            timestamp = sentinel.open('rb').read
            if Integer(timestamp) + 60 > Time.now.to_i
              run_mount_commands = false
            end
          end

          if run_mount_commands and !mount_commands.empty?
            mount_command
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
