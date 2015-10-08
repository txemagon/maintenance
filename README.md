# Maintenance

Several bash scripts to admin a pool of computers.

## Installation

Clone the repository, and add it to your path variable. Preferred dir: ~/bin
Go under hosts dir and type in a file your hosts' IPs.
Then, remove userhost.lst and create a symlink to your new file.

```bash
i@gnu$ ln -s hosts/my_hosts.lst userhost.lst
```

## Customization

Install whatever you cant in one computer and copy the commands in a maneuver file.

## Usage

### remote_{do|install}p?

You can choose one of the following commands:

1. remote_do
1. remote_dop
1. remote_install
1. remote_installp

Where _do_ executes commands whithout interactive shell (you can not feed input on remote computers), but 
has better perfomance than the _install_ family.

May you'll want to do:

```bash
i@gnu$ ./remote_do maneuvers/shutdown
```

to poweroff all computers.

Whenever you are coerced to feed input use the _install_ family.

To select default editor, you have to use

```bash
i@gnu$ ./remote_install maneuvers/editor
```

as long as you will be prompted for input.

_p_ letter stands for parallel, and executes the task assigning one terminal tab per host.

So, instead of last command, this

```bash
i@gnu$ ./remote_installp maneuvers/editor
```
would be more appropiated. 

_remote_installp_ gives you the chance to type in one tab, copy text and paste it in the other ones.

### Other tools

#### copy_credentials

Since you are going to be _ssh_ing to multiple hosts, it is adviseable to copy your credentials as root 
of the remote machine.

For convinience, _copy_credentials_ is porvided.

You can set up user and credentials variables at the top of the file, which default to root and id_rsa.pub by 
default.

#### rcp_dir

Copies one directory recursively from local to remote host.

In addition to installing software sometimes you need to copy big files from your local computer to a remote one.
To increase speed rcp_dir uses _nc_ (netcat) to establish a pipe where parallel compression and decompression is 
been taken at both sides of the pipe. Thus, you need to install _pigz_.

To use _rcp_dir_ you HAVE TO set IFACE variable to your net interface value (wlan0, eth0, etc). Use _ifconfig_ to 
find out.

Use, 
```bash
i@gnu$ rcp_dir --help
```
for further information.

#### rcp_dir2f

Tars and zips one local directory an copies it, using netcat to a remote host. See _rcp_dir_ for further information.
