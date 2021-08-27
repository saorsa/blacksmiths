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
  ![ls,ll](.\images\ls.png)
  - Sorting by modified date
  - The home directory and the ~/ shortcut
- Exploring filesystem
  - Which directory am I in?
  - How much free space is there (how much ram is there?)?
  - Where is a file located (if in the current $PATH definition)
  - Show file contents
  - Create a new empty file
  - Append text to a file
  - Append multiline text to a file
  - Remove files, directories recursively 
  - Showing only the beginning or the end of a file. Follow the end of a file.
  - Comparing file differences
  - Counting words/lines in a file
  - Filesystem permissions
    - Users and groups. Their location on the file system
      - https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-permissions
      - Explain the chmod, chown commands. Change permissions recursively
    - Symbolic links - creating file symlinks, directory symlinks
    - Finding files and directories
      - Finding by name and type
      - Finding text in files
        - Recursively
        - Using text pattern
        - Using regular expression
- Linux redirection https://www.guru99.com/linux-redirection.html
- Pipes and their usage, the grep command (IPC) https://tldp.org/LDP/lpg/node21.html
- CRON jobs, their definition
- Using the tar command to archive/unarchive files
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
  - Detecting arguments and positional parameters
  - Detecting last command exit code
  - Interpolating command in a Variables
  - conditional statements
  - Loops



  https://www.youtube.com/watch?v=oxuRxtrO2Ag
  https://www.youtube.com/watch?v=dDyoNC33TY8