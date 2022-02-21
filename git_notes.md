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

Now add the ssh path to the remote repo.  
~~~
    $ git remote add origin git@github.com:marktyler72/<Github repo name>.git
~~~

## Add files to the repo

Create some files in the directory. Then add them to the repo.  
~~~
    $ git add file1.txt file2.txt
    $ git status
    $ git commit -m 'Added initial versions'
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

Push the updates up to Github.  
~~~
    $ git push -u origin main
~~~
 
