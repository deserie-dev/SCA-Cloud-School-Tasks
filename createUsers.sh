#!/bin/bash

username=$(cat /usernames)

password=$username@SCA

for user in $username
do
  useradd $user
  echo $password | passwd --stdin $user
done