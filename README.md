# Nettenance

Nettenance stands for Net Maintenance, and it was developed as a collection of bash (and only bash) scripts to manage a pool of computers.

## Installation

Clone the repository, dive into it and type:

```bash
i@gnu$ make
i@gnu$ sudo make install
```

Just like the old way. The first _make_ is a shortcut for _make customize_ wich creates the per user directory structure, which consists on the following:

```
    ~/.nettenance
    ~/.nettenance/hosts         # Hold lists of computers' IPs
    ~/.nettenance/maneuvers     # Holds installation files
```

## Customization

The main idea behind nettenance is: 

1. Make your local installation.
2. Dump your history to a file inside ~/.nettenance/maneuvers

For this to work you need to define a list of IPs under under ~/.nettenance/hosts. In my case, as long as I work as a teacher, every file represents a classroom.

And as long as you'll be working for long periods with the same group of computers, define a link named userhost.lst under ~/.nettenance .

```bash
i@gnu$ ln -s hosts/my_hosts.lst userhost.lst
```
Okay. But I'm, a very concerned guy and I'm thinking in those little fellows that I use to call mates. So, I want them not to repeat the job of defining host lists, etc.

Well, in that case, use the system wide config dir: 

```bash
/etc/nettenance
```

Note:

     Local userhost.lst takes precedence over system wide.

Yeah, but I got a but (of course, as everyone). I got so many IPs to generate.
Then use command _netrange_ provided with this suite (see later).

A second warn:

 Do not symlink local userhost.lst (~/.nettenance/userhost.lst) to system wide host list (under /etc/nettenance/hosts).


## Boot

When you work with a list of hosts, sometimes not all of them are on at the same time. Despite you can use
command _awake_ to awake them all, may you want to work only with active ones.

The best solution is to start _host-scan_ daemon:

```bash
/etc/init.d/host-scan start
```

which keeps track of active hosts (under /var/nettenance/scan) and logs all hosts found ever since (under 
/var/nettenance/known).

The daemon also keeps track of macs.

When daemon is running only active hosts listed on userhost.lst are used for the following commands.
When 

## Usage

Here you can find a simple description of commands. Use --help option for further details.
Use tab key for autocompletion.

### Non root commands

For remote administration:

| command | Description |
|--------:|:------------|
| remote-do | _Executes a maneuver on all remote computers._ |
| do-in | _Execute a maneuver on a single remote host._ |

This two commands are based upon the concept of _maneuver_. A maneuver is a file (you can dump from your history) where
a installation procedure is written down. They can be found under ~/.nettenance/maneuvers or /etc/nettenance/maneuvers.

Some examples:

```bash
remote-do -p install-vnc
do-in `seek username` execute_as username firefox
```

General utilities:

| command | Description |
|--------:|:------------|
| rcp-dir | _Copy one dir to/from local or remote computer._ |
| make-booklet | _Create a pdf reordering pages to be fold every n sheets of paper_ |
| list-hosts | _List the hosts of the active set of computers._ |

Notes:
* rcp-dir boost dir copies using netcat and five compressing threads. It uses scp syntax.
* list-hosts list the active hosts whenever the host-scan daemon is activated and no other options are specified. It can also be used to list known macs instead of IPs.
 
Some examples:

```bash
rcp-dir ~me/some_dir root@1.2.3.4:/var/www
```

Auxiliary tools:

| command | Description |
|--------:|:------------|
| seek | _Looks for a given user inside the active host set._ |
| netrange | _Prints all IP numbers within a net range._ |
| shatter | _Splits a file into separate files where first field would be the name of the file._ |

### Root commands

| command | Description |
|--------:|:------------|
| awake             | _Awake via ethernet a list of computers._  |
| copy-credentials  |  _Copy ssh credentials to the active set._ |
| host-scan         |  _Daemons scanning the net to discover active computers and their macs_ |
| push-all          |  _Push a directory tree into remote computers. Home dir (~) is pushed into every user dir._ |
