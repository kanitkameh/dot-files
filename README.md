# dot-files
This is a repository which has configuration files(for vim, shells, window managers, etc.) and scripts for deploying them on your machine and keeping track of their versions on git.
Just clone the repository and edit the configuration files and scripts(in case you want to add more config files to track) to your liking.
If you want to keep your configurations files in your own github repo then fork this one and clone yours instead.
```
git clone git@github.com:kanitkameh/dot-files.git
cd dot-files/
```
# Scripts/Commands
All scripts should be executed from inside of the root directory of the repo you cloned
## Deployment
It also has a script for deployment/placing in the correct places the configuration files.
It is run by the following command:
```
./toSystem.sh < MacOS | Linux >
```
## Uploading the configs to git
Copies the configs from the machine to the repository to be commited and pushed in git. 
```
./toRepository.sh < MacOS | Linux > 
```
# Have fun
