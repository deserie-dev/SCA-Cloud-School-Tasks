#!/bin/bash

#SCA VPC Task: Bash script to create a VPC, subnets and instances on AWS

# Create VPC
echo "Creating VPC ..."
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query Vpc.VpcId --output text

#The command returns the ID of the new VPC e.g. vpc-2021sca
# Create a subnet
echo "Creating subnet ..."
aws ec2 create-subnet --vpc-id vpc-2021sca --cidr-block 10.0.1.0/24

# Create a second subnet
echo "Creating second subnet ..."
aws ec2 create-subnet --vpc-id vpc-2021sca --cidr-block 10.0.0.0/24

# Launch instance into subnet
aws ec2 run-instances --image-id ami-a4827dc9 --count 1 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-e1fb8c9a --subnet-id subnet-b46032ec