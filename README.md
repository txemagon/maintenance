Do not symlink from local to system-wide or viceversa.

System Wide and User config

todo: create script for making per user dir structure.

# Maintenance

Several bash scripts to admin a pool of computers.

## Installation

Clone the repository, and add it to your PATH variable.
Preferred dir: ~/bin

Then, go under hosts dir and type inside a file all your hosts' IPs.
Then, remove userhost.lst and create a symlink to your new file.

```bash
i@gnu$ ln -s hosts/my_hosts.lst userhost.lst
```

## Customization

Install whatever you want in one computer and copy the commands in a maneuver file.

## Usage

### remote_{do|install}p?

You can choose one of the following commands:

1. remote_do
1. remote_dop
1. remote_install
1. remote_installp

Where _do_ executes commands whithout interactive shell (you can not feed input on remote computers), but
has better perfomance than the _install_ family.

May be you'll want to do:

```bash
i@gnu$ ./remote_do maneuvers/shutdown
```

to poweroff all computers.

Whenever you are coerced to feed input use the _install_ family.

To select default editor, you'll have to use,
```bash
i@gnu$ ./remote_install maneuvers/editor
```
as long as you will be prompted for input.

_p_ letter stands for parallel, and executes the task assigning one terminal tab per host.

So, instead of the last command, this

```bash
i@gnu$ ./remote_installp maneuvers/editor
```
would be more appropiated.

_remote_installp_ gives you the chance to type in one tab, copy text and paste it in the other ones.

### Other tools

#### copy_credentials

Since you are going to be _sshing_ to multiple hosts, it is adviseable to copy your credentials as root
in the remote machine.

For convinience, _copy_credentials_ is provided.

You can set up user and credentials variables at the top of the file, which default to root and id_rsa.pub.

#### rcp_dir

Copies one directory recursively from local to remote host.

Syntax:

```bash
i$gnu$ rcp_dir <local_dir_to_copy> [user]@<remote_host>:<remote_dir>

When user not provided, it defaults to your current user in the local machine. Please, notice
that the _at sign_ (@) is not optional.
```

In addition to installing software, sometimes you need to copy big files from your local computer to a remote one.  To increase speed rcp_dir uses _nc_ (netcat) to establish a pipe where parallel compression and decompression
occurs at both sides of the pipe. Thus, you'll need to install _pigz_.

To use _rcp_dir_ you HAVE TO set IFACE variable, at the top of the file,  to your network interface value (wlan0, eth0, etc). Use _ifconfig_ to
find out.

Use,
```bash
i@gnu$ rcp_dir --help
```
for further information.


#### rcp_dir2f

Tars and zips one local directory an copies it, using netcat to a remote host. See _rcp_dir_ for further information.


#### do_in

Executes a maneuver on a single remote machine.

Usage:

    ./do_in [<user>]@<host> <maneuver> [param]*

Example:
```bash
./do_in my_user@192.168.1.2 maneuvers/execute_as anotherone firefox
```

Which will ssh -X in 192.168.1.2 as _my_user_ and will assign _my_user's_ display
authorization to user _anotherone_, and finally will open _anotherone's_ firefox.


#### execute_as

Maneuver that locally executes one program as another user. There are several techniques to achieve
this, but certainly, this is amazing because it can ride an ssh conection.

Usage:

    exectue_as <user> <program>

