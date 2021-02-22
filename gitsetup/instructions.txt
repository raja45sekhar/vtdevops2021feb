1. Create the SSH Key Pair
ssh-keygen -C "pa1devops@vybhava.com"

Setup  remote CentOS server

setup a git user on remote server:

useradd git

Now lets change passwd: for git user.

passwd git
# Better use 'Welcome1'

Add your local generated SSH key to the access list of the git user. We will need to create authorized_keys first
su - git
mkdir ~/.ssh && touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
cd ..
chmod 700 .ssh

On the local PC/Ubuntu, copy the .pub file to VPS and import it into authorized_keys:

cat .ssh/id_rsa_remote_git.pub | ssh root@REMOTE_SERVER_IP "cat >> ~/.ssh/authorized_keys"

cat .ssh/id_rsa.pub | ssh git@192.168.33.100 "cat >> ~/.ssh/authorized_keys"
cd .ssh


Setup a Bare Repository (CenOS)

Now, on the remote server, we can set up an empty repository (called it first-project) for them by running git init with the –bare option:

git init --bare first-project.git

Using git on Local PC
Let’s use gitserver as the hostname of the server on which you’ve set up your ‘git’ user and repository. If you’re running it internally, and you set up DNS for gitserver to point to that server, then you can use the commands pretty much as is:

cd myproject
git init
git add .
git commit -m ‘initial commit’

# Syntax: git remote add origin ssh://git@gitserver:SSH_PORT/FULL_PATH_TO/first-project.git
# To check the branches
git remote -v 
git remote add origin ssh://git@192.168.33.100/home/git/first-project.git

# check branches again Create some new file here
git push origin master


We can also clone it down and push changes back up just as easily:

git clone ssh://git@gitserver:SSH_PORT/FULL_PATH_TO/first-project.git first-project

git clone ssh://git@192.168.33.100/home/git/first-project.git

vi README
git add README.md
git commit -am ‘Add the README file’
git push origin master


On the git server you can validate 
 
 cd first-project.git/
 
 Show branch will confirm that which file added to it.
[git@mydev first-project.git]$ git show-branch
[master] added README
