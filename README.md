# SCA Cloud School (SRE)

This repo contains all my solutions for the weekly tasks for the She Code Africa Cloud School (Site Reliablity Engineer) Bootcamp.

<details>
<summary><b>Pre-Requisites</b></summary><p>
In order to create a virtual machine where I could install Linux, I downloaded Virtual Box and Vagrant. After restarting my computer, inside my terminal I ran the following commands to install Ubuntu on my VM

```
mkdir vagrant
cd vagrant
vagrant box add ubuntu/trusty64
vagrant init ubuntu/trusty64
```

Once the Ubuntu box finished installing I ran

```
vagrant up
vagrant ssh
```

![](/images/vagrantup.png)
![](/images/vagrantssh.png)

---

#### Resources Used:

- [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Download Vagrant](https://www.vagrantup.com/downloads)
- [Installing VirtualBox and Vagrant](https://medium.com/@botdotcom/installing-virtualbox-and-vagrant-on-windows-10-2e5cbc6bd6ad)

---

</p></details>

<details>
<summary><b>Week 1: Intro to DevOps & Linux Basics</b></summary><p>

**TASK 1: Create 3 groups and 15 users.**

I ran the following command in order to create users.

```
sudo adduser UserName
```

I used 'adduser' instead of 'useradd' because 'adduser' gives the user a home directory and gives prompts to give the user a password.

To create groups I used the following command

```
sudo groupadd GroupName
```

To check that my users had been created I ran

```
cat /etc/passwd
```

![](/images/users.png)

To check that my groups had been created I ran

```
cat /etc/group
```

![](/images/groups.png)

---

#### Resources Used:

- [How to create users and groups in Linux from the command line](https://www.techrepublic.com/article/how-to-create-users-and-groups-in-linux-from-the-command-line/)
- [Ubuntu Docs](https://help.ubuntu.com/community/AddUsersHowto)

---

**TASK 2: Assign the 15 users across the 3 groups**

In order to assign a user to a group, I used the command 'usermod' which stands for user modification.

```
sudo usermod -aG GroupName userName
```

The flags -aG mean 'apphend Group.'

![](/images/groupassign.png)

I made the following group assignments:

- Group1: user1, user2, user3, user4, user5
- Group2: user6, user7, user8, user9, user10
- Group3: user11, user12, user13, user14, user15

---

#### Resources Used:

- [Network Chuck YouTube Video](https://youtu.be/jwnvKOjmtEA)

---

**TASK 3: Demonstrate that user(s) in a group cannot access files/folders that belong to another group unless they are added to that group**

I started of by creating a new folder and file

```
mkdir newdir
cd newdir
touch test.txt
```

I ran the command `ls -l` which will list the file along with information about the user and group that owns the file. Currently owner of test.txt is listed as `vagrant` which is my username since I am accessing my Ubuntu VM using Vagrant.

To change the owner of the group to user1 I ran

```
sudo chown user1 test.txt
```

Now running `ls -l` shows that test.txt is owned by user1, but group ownership still belongs to vagrant. To change the group ownership to Group1 I ran

```
sudo chrgrp Group1 test.txt
```

I could have also used the `chown` to change group ownership but in this instance I used the `chgrp` command which stands for `change group.`

I also learnt about the `-R` flag whcih recursively changes ownership. When changing the ownnership of a folder, you have to think about permissions for the folder, along with the items inside the folder. Using `chown` or `chgrp` with the `-R` flag helps you do that.

---

#### Resources Used:

- [Setting Permissions with chown chmod](https://www.baeldung.com/linux/chown-chmod-permissions)
- [Chgrp Command In Linux](https://linuxize.com/post/chgrp-command-in-linux/)

---

</p></details>

<details>
<summary><b>Week 2: Bash Scripting</b></summary><p>

[My Notes](https://github.com/deserie-dev/Bash-Scripting)

I created a bash script to automate the creation of users. In week 1, we had to create 15 users one by one. The bash script createusers.sh makes use of a for loop in order to automate the process of creating users.

1. Create a text file containing the 15 usernames to be created (usernames.txt)

2. Write the bash script to automate the creation of users (createusers.sh)

3. Make the bash script executable by running

```
chmod u+x createusers.sh
```

</p></details>

<details>
<summary><b>Week 3: Virtualization and Containerization</b></summary><p>

Repo with files for this weeks task: [deseriedocker1](https://github.com/deserie-dev/deseriedocker1)

**Pre-requisites**
Download and install Docker. I am on a Windows machine running Windows home. I used the following guide to help me: [Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10). Once I had done that I was able to download [Docker Desktop for Windows](https://docs.docker.com/desktop/windows/install/#system-requirements-for-wsl-2-backend).

**TASK 1: Write a Dockerfile (for any sample application), build an image from it, and then launch a container from that image.**

I made a simple application with HTML & CSS on the front end and Node on the back end.
![](/images/myapp.gif)

I wrote the Dockerfile in the project's root folder.
![](/images/dockerfile.png)

A Dockerfile is a list of instructions that Docker uses to build an image. An image is used to build a container. **FROM** specifies the parent image from which I'm building, in this case Node:10. Official versions of images can be found on Docker Hub. **WORKDIR** sets the working directory for all the commands that follow it, so it's like a cd into that directory. I used an absolute path to my deseriedocker1 file. **COPY** copies files from my working directory onto the current working directory in the image. **RUN** will install the projects dependencies, the same as if I was running a normal Node app, I would run "npm install" to install all my projects dependencies. **EXPOSE** opens a network port so that I can reach my Node app inside the container. **CMD** is the commands that are run when the container starts up.

To build the image, I cd'd into the folder with the Dockerfile and ran

```
  docker build -t my-app:1.0 .
```

![](/images/dockerbuild.png)

![](/images/dockerimage.png)

To launch a container from the image I ran

```
  docker run my-app:1.0
```

![](/images/dockerrun.png)

![](/images/myappcontainer.png)

**TASK 2: Write a docker-compose file for the same application, then build and run the application.**

I wrote the docker-compose file in my project's root folder. Docker Compose is a tool for running multiple containers although in this case I only have one. Docker compose is a YAML file used to configure an app's services. **Version** specifies the version of Docker Compose. **my-app** is the container name and **image** tells Docker Compose to deploy my container using the official Node image. **ports** specifies which ports are going to be open, the first one is the port on the host, the second one is the port on the container.

![](/images/dockercompose.png)

I then ran

```
  docker-compose up
```

![](/images/composeup.png)

---

#### Resources Used:

- [IBM Docs on Virtualization](https://www.ibm.com/cloud/learn/virtualization-a-complete-guide)

- [IBM Docs on Containerization](https://www.ibm.com/cloud/learn/containerization)

---

</p></details>
