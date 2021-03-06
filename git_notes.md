Git Notes
=========

## Git summary
The following diagram illustrates the relationship between the various areas and commands.


![Git areas and commands](Git_workflow.png)


## Configure Git

Set the user name and user email for git. Use the no-reply email address. 
~~~
    $ git config --global user.name "Mark Tyler"
    $ git config --global user.email "99153612+marktyler72@users.noreply.github.com"
~~~
See the list of global config parameters.
~~~
    $ git config --global --list
~~~

Set the name of the default branch to main for compatability with Github.
~~~
    $ git config --global init.defaultBranch main
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
Before you do this you need to create the repo on Github using the web interface!!
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
    $ git diff    
    -- OR --
    $ git diff <source_branch> <target_branch>
~~~

## Fetch + Merge vs Pull
In many cases _git fetch_ followed by a _git merge_ equals a _git pull_.

_git pull_ is context sensitive, so Git will merge any pulled commits into the branch you are currently working in if it can. _git pull_ automatically merges the commits without letting you review them first.

Using _git fetch_, Git gathers any commits from the target branch that do not exist in your current branch and stores them in your local repository. However, it does not merge them with your current branch. This is particularly useful if you need to keep your repository up to date, but are working on something that might break if you update your files. To integrate the commits into your master branch, you use _git merge_.

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

## Dotfiles
Use the dotfiles command instead of git to configure the dotfiles. This is a special personal configuration.
