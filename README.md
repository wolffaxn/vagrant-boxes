# vagrant-boxes

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/wolffaxn/vagrant-boxes/master.svg)](https://github.com/wolffaxn/vagrant-boxes)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [About](#about)
- [Requirements](#requirements)
- [Current Vagrant boxes](#current-vagrant-boxes)
- [Usage](#usage)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## About

Packer templates for building minimal Vagrant boxes

## Requirements

The following software must be installed locally before you can use Packer to build the Vagrant boxes.

* [packer](http://packer.io) 1.1.2 or greater
* [vagrant](http://vagrantup.com) 1.9.3 or greater
* [virtualbox](https://www.virtualbox.org) 5.1.30 or greater

## Current Vagrant boxes

* CentOS 6.9
* CentOS 7.3.1611
* CentOS 7.4.1708
* CentOS 7.5.1804

## Usage

```bash
packer build --force centos-6.9.json
packer build --force centos-7.3.json
packer build --force centos-7.4.json
packer build --force centos-7.5.json
```

Add the boxes to Vagrant.

```bash
vagrant box add wolffaxn/centos6 builds/centos-6.9-x86_64.box
vagrant box add wolffaxn/centos7 builds/centos-7.5-x86_64.box
```

## License

This project is licensed under the terms of the [MIT license](LICENSE).
