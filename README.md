vagrant-mount-command
=====================

A vagrant plugin that runs a command after all of your vagrant mounts have mounted.

## Installation

Run `vagrant plugin install vagrant-mountcommand`

## Configuration

You can add lines by adding `config.mount_commands.command "command"`. The
command will be run using sudo, so there is no need for you to prefix the
command with sudo.

## Notes

- This wont run on the first vagrant up
    - This is because it runs before any provisioning has happened, so your command is unlikely to be succesfull.

As of right now, this plugin is pretty rough. It works for my particular
problem, but its fairly shaky. If you would like to use this, go ahead, but it
may take some work for you to get it working. If, in that process you notice
or fix a problem I would really appriciate a pull request or at least an issue.
