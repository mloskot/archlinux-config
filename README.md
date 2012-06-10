Arch Linux Setup
================

URL: https://github.com/mloskot/archlinux-config

Collection of system configuration files and user-specific
dotfiles for Arch Linux installation.

I mainly use it to setup the system on my Lenovo ThinkPad T400.

Overview
--------

Hostname: dog
Username: root, mloskot
Purpose: common applications, internet, software development

Directories
-----------

* `/etc`          - system-wide configuration
* `/home/mloskot` - user-specific dotfiles dedicated for mloskot user

Deployment
----------

### System-wide configuration:

*TODO*

### User-specific configuration:

* Clone the project, typically into `$HOME/.dotfiles`.
* Inspect header of `$HOME/.dotfiles/deploy-mloskot.sh` script for configuration options.
* Deploy:

```shell
    $ cd $HOME/.dotfiles
    $ ./deploy-mloskot.sh
```
* Review the log genererated to `stdout`.

Author
------

Mateusz Loskot (mateusz at loskot dot net)
http://mateusz.loskot.net

License
-------

I hereby grant free use of the files included under archlinux-config project, and release it to the public domain.
If your jurisdiction does not recognize the concept of public domain, choose the MIT License.