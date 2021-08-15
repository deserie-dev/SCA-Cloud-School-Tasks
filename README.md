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

</p></details>
```
