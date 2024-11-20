# dot-files
This is a repository which has configuration files(for vim, shells, window managers, etc.) and scripts for deploying them on your machine allowing you to keeping track of their versions on git.
Just clone the repository and edit the configuration files and scripts to your liking. New files and directories should be added to `mkSymlinks.sh` script to be deployed and to `deleteSymlinks.sh` script to be removed.
If you want to keep your configurations files in your own github repo then fork this one and clone yours instead.
```
git clone git@github.com:kanitkameh/dot-files.git
cd dot-files/
```
# Scripts/Commands
All scripts should be executed from inside of the root directory of the repo you cloned

## Deployment
It has a script for deployment/placing symlinks in the correct places for the configuration files.
It is run by the following command:
```
./mkSymlinks.sh < MacOS | Linux >
```
# Have fun!
