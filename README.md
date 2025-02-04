# Linux Setup

> [!IMPORTANT]
> I've been mostly working in hybrid environments for which I maintain my configs in https://github.com/mloskot/dotfiles repository.
> I no longer use plain Arch on my computers and this repo has not received updates for very long time.
> It's gone archived mode.

https://github.com/mloskot/linux-config

Collection of user dotfiles and system configuration files for 
my Linux systems based on Arch Linux, Debian and Ubuntu.

I use this bundle to configure:
* Arch Linxu on Lenovo ThinkPad T400 and Asus Eee PC 901
* Ubuntu on Lenovo Thinkpad W700
* Debian on remote VPS

Originally developed for Arch Linux: https://github.com/mloskot/archlinux-config

## Systems

### Arch Linux

*TODO* 

### Ubuntu

*TODO* 

### Debian

*TODO* 

## Directories

* `/etc`          - system-wide configuration
* `/home/mloskot` - user-specific dotfiles dedicated for mloskot user

## Deployment

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

## Author

[Mateusz Loskot](http://mateusz.loskot.net) (mateusz at loskot dot net)

## License

I hereby grant free use of the files included under archlinux-config project, and release it to the public domain.
If your jurisdiction does not recognize the concept of public domain, choose the MIT License.
