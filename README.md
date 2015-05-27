boundary-plugins-vagrant
========================

Example _Vagrantfile_ that creates a Ubuntu 14.04 LTS (Trusty Tah) 64-bit box with various services for testing plugins.

## Requirements
- Vagrant (http://www.vagrantup.com/downloads.html)
- Virtualbox (https://www.virtualbox.org/wiki/Downloads)
- 2 Gb of RAM
- 2 Cores

## Instructions

### First time configuration

1. Edit _bootstrap.sh_ and set your environment variables

### Startup

1. Start the virtual machine

    ```bash
    $ vagrant up
    ```
2. Wait until the virtual machines starts and completes provisioning

3. To login onto the host:

    ```bash
    $ vagrant ssh
    ```

### Halt

1. To halt the virtual machine, logoff and run:

    ```bash
    $ vagrant halt
    ```

### Shutdown
Completely destroys the VM and its state, but it also frees up all the disk usage associated with the VM instance.

1. Stop and destroy the virtual machine

    ```
    $ vagrant destroy
    ```

## Services running and port forwarded

Please check in your host if you have the following ports free

| Service Name | Guest Port | Host Port |
|--------------|------------|-----------|
| couchbase    | 8091       | 8091      |
| apache2	| 80 | 80|
