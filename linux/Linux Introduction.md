- Linux and BASH
- Posix
- https://tldp.org/LDP/intro-linux/html/index.html
- The linux filesystem  https://tldp.org/LDP/intro-linux/html/sect_03_01.html
  - Inodes
    - At the time a new file is created, it gets a free inode. In that inode is the following information:  
            
            ```Owner and group owner of the file.
            File type (regular, directory, ...)
            Permissions on the file Section 3.4.1  
            Date and time of creation, last read and change.  
            Date and time this information has been changed in the inode.  
            Number of links to this file.  
            File size  
            An address defining the actual location of the file data.```
            
- https://www.linux.com/training-tutorials/linux-filesystem-explained/
- Everything is a file concept - what is it?
- The kernel
- The Shell
  - Shell types
    - sh or Bourne Shell: the original shell still used on UNIX systems and in UNIX related environments. This is the basic shell, a small program with few features. When in POSIX-compatible mode, bash will emulate this shell.
    - bash or Bourne Again SHell: the standard GNU shell, intuitive and flexible. Probably most advisable for beginning users while being at the same time a powerful tool for the advanced and professional user. On Linux, bash is the standard shell for common users. This shell is a so-called superset of the Bourne shell, a set of add-ons and plug-ins. This means that the Bourne Again SHell is compatible with the Bourne shell: commands that work in sh, also work in bash. However, the reverse is not always the case. All examples and exercises in this book use bash.
    - csh or C Shell: the syntax of this shell resembles that of the C programming language. Sometimes asked for by programmers.
    - tcsh or Turbo C Shell: a superset of the common C Shell, enhancing user-friendliness and speed.
    - ksh or the Korn shell: sometimes appreciated by people with a UNIX background. A superset of the Bourne shell; with standard configuration a nightmare for beginning users.
    - cat /etc/shells
    

- Navigating the file system
  - The most important files https://tldp.org/LDP/intro-linux/html/sect_03_02.html
  - Listing attributes and permissions
```console
the_great_danton@DESKTOP-7QSFUSB:~$ ll
total 28
drwxr-xr-x 4 the_great_danton the_great_danton 4096 Aug 27 10:45 ./
drwxr-xr-x 3 root             root             4096 Aug 27 10:44 ../
-rw-r--r-- 1 the_great_danton the_great_danton  220 Aug 27 10:44 .bash_logout
-rw-r--r-- 1 the_great_danton the_great_danton 3771 Aug 27 10:44 .bashrc
drwxr-xr-x 2 the_great_danton the_great_danton 4096 Aug 27 10:44 .landscape/
drwxr-xr-x 3 the_great_danton the_great_danton 4096 Aug 27 10:45 .local/
-rw-r--r-- 1 the_great_danton the_great_danton    0 Aug 27 10:44 .motd_shown
-rw-r--r-- 1 the_great_danton the_great_danton  807 Aug 27 10:44 .profile
the_great_danton@DESKTOP-7QSFUSB:~$ ls -al
total 28
drwxr-xr-x 4 the_great_danton the_great_danton 4096 Aug 27 10:45 .
drwxr-xr-x 3 root             root             4096 Aug 27 10:44 ..
-rw-r--r-- 1 the_great_danton the_great_danton  220 Aug 27 10:44 .bash_logout
-rw-r--r-- 1 the_great_danton the_great_danton 3771 Aug 27 10:44 .bashrc
drwxr-xr-x 2 the_great_danton the_great_danton 4096 Aug 27 10:44 .landscape
drwxr-xr-x 3 the_great_danton the_great_danton 4096 Aug 27 10:45 .local
-rw-r--r-- 1 the_great_danton the_great_danton    0 Aug 27 10:44 .motd_shown
-rw-r--r-- 1 the_great_danton the_great_danton  807 Aug 27 10:44 .profile
the_great_danton@DESKTOP-7QSFUSB:~$
```
  - Sorting by modified date
  ```console
  the_great_danton@DESKTOP-7QSFUSB:~$ ls -alt
total 28
drwxr-xr-x 4 the_great_danton the_great_danton 4096 Aug 27 10:45 .
drwxr-xr-x 3 the_great_danton the_great_danton 4096 Aug 27 10:45 .local
-rw-r--r-- 1 the_great_danton the_great_danton    0 Aug 27 10:44 .motd_shown
drwxr-xr-x 2 the_great_danton the_great_danton 4096 Aug 27 10:44 .landscape
-rw-r--r-- 1 the_great_danton the_great_danton  220 Aug 27 10:44 .bash_logout
-rw-r--r-- 1 the_great_danton the_great_danton 3771 Aug 27 10:44 .bashrc
-rw-r--r-- 1 the_great_danton the_great_danton  807 Aug 27 10:44 .profile
drwxr-xr-x 3 root             root             4096 Aug 27 10:44 ..
  ```
  - The home directory and the ~/ shortcut
  ```console
  the_great_danton@DESKTOP-7QSFUSB:~/dir1/dir1a$ cd
the_great_danton@DESKTOP-7QSFUSB:~$ cd dir1/dir1a
the_great_danton@DESKTOP-7QSFUSB:~/dir1/dir1a$ cd ~
the_great_danton@DESKTOP-7QSFUSB:~$ cd dir1/dir1a
  ```
- Exploring filesystem
  - Which directory am I in?
  ```console
  the_great_danton@DESKTOP-7QSFUSB:~$ pwd
  /home/the_great_danton
  ```
  - How much free space is there (how much ram is there?)?
```console
the_great_danton@DESKTOP-7QSFUSB:~$ df -h --total
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdb        251G  1.2G  238G   1% /
tmpfs           2.9G     0  2.9G   0% /mnt/wsl
tools           140G   88G   52G  64% /init
none            2.9G     0  2.9G   0% /dev
none            2.9G  4.0K  2.9G   1% /run
none            2.9G     0  2.9G   0% /run/lock
none            2.9G     0  2.9G   0% /run/shm
none            2.9G     0  2.9G   0% /run/user
tmpfs           2.9G     0  2.9G   0% /sys/fs/cgroup
C:\             140G   88G   52G  64% /mnt/c
D:\              98G   74G   24G  76% /mnt/d
total           648G  251G  384G  40% -
the_great_danton@DESKTOP-7QSFUSB:~$ free -m
              total        used        free      shared  buff/cache   available
Mem:           5833          97        5670           0          66        5582
Swap:          2048           0        2048
```
  - Where is a file located (if in the current $PATH definition)
```console
the_great_danton@DESKTOP-7QSFUSB:/$ find /bin/ -name 'ls'
/bin/ls
```
  - Show file contents
  ```console
the_great_danton@DESKTOP-7QSFUSB:~$ cat Two\ cures\ for\ love
  Two Cures for Love
  Wendy Cope
  1. Don’t see him. Don’t phone or write a letter.
  2. The easy way: get to know him better.
  ```
  - Create a new empty file
  ```console
  the_great_danton@DESKTOP-7QSFUSB:~$ touch 'brand new empty file'
the_great_danton@DESKTOP-7QSFUSB:~$ ls
'Two cures for love'  'brand new empty file'   dir1   dir2   dir3   file
```
  - Append text to a file
  ```console
  the_great_danton@DESKTOP-7QSFUSB:~$ echo 'text that will be appended' >> brand\ new\ empty\ file
the_great_danton@DESKTOP-7QSFUSB:~$ cat brand\ new\ empty\ file

text that will be appended
the_great_danton@DESKTOP-7QSFUSB:~$ echo 'text that will be appended' >> brand\ new\ empty\ file
the_great_danton@DESKTOP-7QSFUSB:~$ cat brand\ new\ empty\ file

text that will be appended
text that will be appended
```
  - Append multiline text to a file
  ```console 
  the_great_danton@DESKTOP-7QSFUSB:~$ cat << EOF >> brand\ new\ empty\ file
Line 1
Line 2
Line 3
the_great_danton@DESKTOP-7QSFUSB:~$ cat brand\ new\ empty\ file
Line 1
Line 2
Line 3
```
  - Remove files, directories recursively 
  ```console
  the_great_danton@DESKTOP-7QSFUSB:~$ ls
'Two cures for love'  'brand new empty file'   dir1   dir2   dir3   file
  the_great_danton@DESKTOP-7QSFUSB:~$ ls dir1/dir1a/
fugitive
the_great_danton@DESKTOP-7QSFUSB:~$ rm -r dir1/
the_great_danton@DESKTOP-7QSFUSB:~$ ls
'Two cures for love'  'brand new empty file'   dir2   dir3   file
```
  - Showing only the beginning or the end of a file. Follow the end of a file.
  ```console
  the_great_danton@DESKTOP-7QSFUSB:~$ head Thinking
Thinking
Walter D Wintle

If you think you are beaten, you are
If you think you dare not, you don't,
If you like to win, but you think you can't
It is almost certain you won't.

If you think you'll lose, you're lost
For out of the world we find,
```
```console
the_great_danton@DESKTOP-7QSFUSB:~$ tail Thinking

If you think you are outclassed, you are
You've got to think high to rise,
You've got to be sure of yourself before
You can ever win a prize.

Life's battles don't always go
To the stronger or faster man,
But soon or late the man who wins
Is the man WHO THINKS HE CAN!
```
  - Comparing file differences
  ```console
the_great_danton@DESKTOP-7QSFUSB:~$ cat file1
Same line
Same line
Different line
Same line
Same line
Different line
the_great_danton@DESKTOP-7QSFUSB:~$ cat file2
Same line
Same line
Same line
Same line
Same line
Same line
the_great_danton@DESKTOP-7QSFUSB:~$ diff file1 file2
3d2
< Different line
6c5,6
< Different line
---
> Same line
> Same line
```
  - Counting words/lines in a file
  ```console
  the_great_danton@DESKTOP-7QSFUSB:~$ cat file1
two words
the_great_danton@DESKTOP-7QSFUSB:~$ wc file1
 1  2 10 file1
 ```
 ```console
the_great_danton@DESKTOP-7QSFUSB:~$ cat file1
Here we have 5 words
the_great_danton@DESKTOP-7QSFUSB:~$ wc file1
 1  5 21 file1
 ```
  - Filesystem permissions
    - Users and groups. Their location on the file system
      - https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-permissions
      - The **chmod** command is used for changing the mode(i.e. the permissions) of a file. https://www.digitalocean.com/community/tutorials/linux-permissions-basics-and-how-to-use-umask-on-a-vps#types-of-permissions
      - The **chown** command allows you to change the user and/or group ownership of a given file, directory, or symbolic link. https://linuxize.com/post/linux-chown-command/
      - To change the permission of directory recursively add the -R option to the **chmod** command https://linuxize.com/post/chmod-recursive/  
      `$ chmod -R MODE DIRECTORY`

```console 
the_great_danton@DESKTOP-7QSFUSB:~$ ls dir2 -l
total 12
drwxr-xr-x 2 the_great_danton the_great_danton 40Aug 28 19:36 dir2a
drwxr-xr-x 2 the_great_danton the_great_danton 40Aug 28 19:36 dir2b
drwxr-xr-x 3 the_great_danton the_great_danton 40Aug 28 19:37 dir2c
the_great_danton@DESKTOP-7QSFUSB:~$ chmod -R 777 dir2/
the_great_danton@DESKTOP-7QSFUSB:~$ ls dir2 -l
total 12
drwxrwxrwx 2 the_great_danton the_great_danton 40Aug 28 19:36 dir2a
drwxrwxrwx 2 the_great_danton the_great_danton 40Aug 28 19:36 dir2b
drwxrwxrwx 3 the_great_danton the_great_danton 40Aug 28 19:37 dir2c
```
- Symbolic links - creating file symlinks, directory symlinks

```console
the_great_danton@DESKTOP-7QSFUSB:~/symbolic links$ ln -s Thinking ThinkingS
the_great_danton@DESKTOP-7QSFUSB:~/symbolic links$ ls -l
total 4
-rw-r--r-- 1 the_great_danton the_great_danton 9 Aug 28 20:01 Thinking
lrwxrwxrwx 1 the_great_danton the_great_danton 8 Aug 28 20:01 ThinkingS -> Thinking
```

```console
the_great_danton@DESKTOP-7QSFUSB:~/symbolic links$ ls
Original
the_great_danton@DESKTOP-7QSFUSB:~/symbolic links$ ln -s Original/ SoftLinkOriginal
the_great_danton@DESKTOP-7QSFUSB:~/symbolic links$ ls -l
total 4
drwxr-xr-x 2 the_great_danton the_great_danton 4096 Aug 28 20:10 Original
lrwxrwxrwx 1 the_great_danton the_great_danton    9 Aug 28 20:10 SoftLinkOriginal -> Original/
```
- Finding files and directories
  - Finding by name and type
    - name

```console
the_great_danton@DESKTOP-7QSFUSB:~$ find . -name file1
./symbolic links/Original/folder1/file1
./symbolic links/Original/file1
./file1
```
    - type

```console
the_great_danton@DESKTOP-7QSFUSB:~$ find . -type f
./symbolic links/Original/file2
./symbolic links/Original/folder1/file1
./symbolic links/Original/file1
./file2
./.landscape/sysinfo.log
./.sudo_as_admin_successful
./copy_file.sh
...
```
- Finding text in files
  - Recursively
  - Using text pattern
```console
the_great_danton@DESKTOP-7QSFUSB:~$ grep -r './' -e 'to'
./Two cures for love:    2. The easy way: get to know him better.
./dir3/textfile:to
./.bash_logout:# when leaving the console clear the screen to increase privacy
./.bashrc:# don't put duplicate lines or lines starting with space in the history.
...        
```
  - Using regular expression
```console
the_great_danton@DESKTOP-7QSFUSB:~$ grep p...e Two\ cures\ for\ love
1. Don’t see him. Don’t phone or write a letter.
```

- Linux redirection https://www.guru99.com/linux-redirection.html
- Pipes and their usage, the grep command (IPC) https://tldp.org/LDP/lpg/node21.html
- CRON jobs, their definition
- Using the tar command to archive/unarchive files https://www.howtogeek.com/248780/how-to-compress-and-extract-files-using-the-tar-command-on-linux/
- Using the gzip/gunzip commands
- Package managers - comparing apt-get and snap for ubuntu
  - Using YUM in Centos
- Creating, deleting users, adding users to groups. Checking for users and groups existence and belonging to groups.
  - Impersonating users
  - Executing commands on behalf of another user
- Environmental Variables
  - Listing environmental variables, filtering using grep, visualising env variable values
  - Adding/changing an environmental variable for the current session, current user, current system(persistent variables)
- Systemctl
  - Starting, stopping, restarting, redirecting services
  - Creating your own service file
- Using the sed command to regex replace the contents in files: dry run, 
  - SSH
    - using the ssh command to connect to another box
    - using the scp command to copy files to another box
    - creating a certificate and authorizing a user to connect to a box https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys
    - Where are the users' ssh keys located? What permissions do they ahd trhe containing directory have?
    - Enabling, disabling, configuring password authentication
- Rsync - syncing files across folders and boxes(using ssh) - a simple tutorial
- BASH
  - Variables, output redirection
  - read
  - Control statements
  - Bash brackets https://dev.to/rpalo/bash-brackets-quick-reference-4eh6
  - Functions
  - Detecting arguments and positional parameters https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/
  - Detecting last command exit code
  - Interpolating command in a Variables
  - conditional statements
  - Loops



  https://www.youtube.com/watch?v=oxuRxtrO2Ag
  https://www.youtube.com/watch?v=dDyoNC33TY8