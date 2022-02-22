Git Notes
=========

## Configure Git

Set the user name for Git  
~~~
    $ git config --global user.name "Mark Tyler"
~~~
See the currently set user name  
~~~
    $ git config --global user.name
~~~

Set the user email for git. Use the no-reply email address.  
~~~
    $ git config --global user.email "99153612+marktyler72@users.noreply.github.com"
~~~
See the current e-mail address  
~~~
    $ git config --global user.email
~~~

Generate an ssh key to authenticate with Github  
~~~
    $ ssh-keygen -t ed25519 -C "99153612+marktyler72@users.noreply.github.com"
~~~
Once the ssh key has been added to Github then test to see if we can connect.  
~~~
    $ ssh -T git@github.com
~~~

## Create a repository

Make the directory that will be the base of the repository.  
~~~
    $ mkdir ~/projects/project1
    $ cd ~/projects/project1
~~~

Initialise the repo.  
~~~
    $ git init
~~~

Now add the new repo to the remote git server. For Github this will add it to branch main.  
~~~
    $ git remote add origin git@github.com:marktyler72/<Github repo name>.git
~~~

## Clone a repository 
Clone a repository from a remote repo to the local machine.
~~~
    $ git clone git@github.com:marktyler72/<Github repo name>.git /path/to/local/repo
~~~

## Add files to the repo

Create some files in the directory. Then add them to the repo.  
~~~
    $ git add file1.txt file2.txt
    $ git status
    $ git commit -m 'Added initial versions'
~~~

Push the updates up to Github.  
~~~
    $ git push -u origin main
~~~
 
Remove a file you added but have not committed.
~~~
    $ git restore --staged <file-name>
~~~

Have a look at the commit history.  
~~~
    $ git log
~~~

To ignore local files that are not tracked
~~~
    $ git config --local status.showUntrackedFiles no
~~~

## Branches
Create a new branch named "feature_x" and switch to it
~~~
    $ git checkout -b feature_x
~~~
Switch back to main
~~~
    $ git checkout main
~~~
Delete the branch
~~~
    $ git branch -d feature_x
~~~
Push the branch up to the server
~~~
    $ git push origin <branch>
~~~

## Update and Merge
To update your local repository to the newest commit (fetch and merge remote changes)
~~~
    $ cd /path/to/working/dir
    $ git pull
~~~
To merge another branch into your active branch
~~~
    $ git merge <branch>
~~~
If there are merge conflicts you need to manually merge the conflicts by editing the files. After updating then add the files. You can also look at the diffs.
~~~
    $ git add <filename>
    $ git diff <source_branch> <target_branch>
~~~

## Replacing local changes
To roll back a file to the HEAD version. (Files already commited will be kept)
~~~
    $ git checkout -- <filename>
~~~

To drop all your local changes and commits, fetch the latest history from the server and point your local main branch at it
~~~
    $ git fetch origin
    $ git reset --hard origin/main
~~~
