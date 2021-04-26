# Hi-Cloud

Note this stack is a continual work in progress and capabilities will change over time

## Table of Contents
* [Overview]
* [Requirements]
* [Notes about build environment]
* [Ansible Configuration]
* [Terraform.py submodule]
* [Initialization Steps]
* [Launching the Stack]
* [Destroying the Stack]

## Overview

This stack is designed to launch an ELK stack in an AWS environment using Terraform and Ansible for infrastructure creation and provisioning.  

The stack consists of the following components:

* Public VPC
* Internet Gateway
* Security Groups
* Instances (one each for now)
  * Elasticsearch Master
  * Elasticsearch Data
  * Logstash
  * Kibana

## Requirements

* Access to an [AWS](https://aws.amazon.com/) account
* Ubuntu 20.04 AMI.  More options to follow later
* [AWSCLI](https://aws.amazon.com/cli/) installed locally and properly configured
* [Python](https://www.python.org/) installed locally
* [Ansible](http://docs.ansible.com/ansible/intro_installation.html) installed locally.  
* [Terraform](https://www.terraform.io/intro/getting-started/install.html) installed locally.
## Environment setup

* run: ./prereq.sh 

## Notes about build environment

The following versions of tools and OS were used to initially develop this stack
* Ubuntu 20.04.1 LTS
* Terraform 0.13.5
* Ansible 2.9.6
* Python 3.8.5
* awscli 2.1.17

## Ansible Configuration

Currently testing these options in /etc/ansible/ansible.cfg for a reliable fact store.  See [This](https://docs.ansible.com/), we are using the dynamic inventory.

## Initialization Steps

Grab the repository
```
git clone https://git.hashedin.com/sachin.slathia/hi-cloud-hu/-/tree/hicloud_project
```
Copy credentials in the credentials file at root directory (~/.aws/credentials).
```
[default]
aws_access_key_id= "YOUR ACCESS KEY"
aws_secret_access_key= "YOUR SECRET KEY"
```
## Launching the Stack

To launch the stack you can run the following commands

```
terraform init 
terraform plan  
terraform apply
```
Plan provides an overview of changes to be applied and Apply will actually apply those changes
```
## Ansible Playbook

Run ansible playbook to configure cluster components

```
To configure the stack you can run the following command

ansible-playbook elasticsearch.yml -i inventory

```
## Destroying the stack

To destroy the stack simply run:

```
terraform destroy
```
