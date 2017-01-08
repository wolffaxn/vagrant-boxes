# vagrant-boxes

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/wolffaxn/vagrant-boxes/master/LICENSE)

Packer templates for building minimal Vagrant boxes

### Requirements

The following software must be installed locally before you can use Packer to build the Vagrant boxes.

* [packer](http://packer.io)
* [vagrant](http://vagrantup.com)
* [virtualbox](https://www.virtualbox.org)

### Current Vagrant boxes

* CentOS 6.8 (minimal)
* CentOS 7.3.1611 (minimal)

### Usage

```bash
packer build --force centos-6.8.json
packer build --force centos-7.3.json
```

Add the boxes to Vagrant.

```bash
vagrant box add wolffaxn/centos6 builds/centos-6.8-x86_64.box
vagrant box add wolffaxn/centos7 builds/centos-7.3-x86_64.box
```
