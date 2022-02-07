Git Notes
=========

## Configure Git ##
Set the user name for Git
  $ git config --global user.name "Mark Tyler"
See the currently set user name
  $ git config --global user.name
Set the user email for git. Use the no-reply email address.
  $ git config --global user.email "99153612+marktyler72@users.noreply.github.com"
See the current e-mail address
  $ git config --global user.email

Generate an ssh key to authenticate with Github
  $ ssh-keygen -t ed25519 -C "99153612+marktyler72@users.noreply.github.com"
Once the ssh key has been added to Github then test to see if we can connect.
  $ ssh -T git@github.com

