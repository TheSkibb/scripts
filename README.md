# Scripts

This is a collection of different scripts to improve my terminal workflow

To install, clone the repo, and add
~~~bash
source <location of repo>/zsh
~~~

to your bashrc or zshrc

# The script included

## Kladd

Kladd is a sketching tool. Sketch files are put in the /tmp directory.

how to sketch a new file:
~~~bash
kladd <name-of-sketch>
~~~

example:
~~~bash
kladd 1
~~~

how to run a sketch
~~~bash
kladd <name-of-sketch> run <program-to-run-sketch>
~~~

example:
~~~bash
kladd 1.py
~~~

~~~bash
kladd 1.py run python3
~~~

how to list all sketches
~~~bash
kladd list
~~~

Kladd requires no dependencies.
Default editor is neovim from a binary file (because that is what i run)
To change editor, change the $editor environment variable in the script

## dn - Daily Note

~~~bash
dn
~~~
Opens a markdown file for daily note.

~~~bash
wn
~~~
Opens a markdown file for weekly note.

To change to the location of where the notes open change the $NOTE $DAILY and $WEEKLY variables.

$NOTE is the directory of all your notes. The dn script will cd to this directory so all files in this directory can be edited.
$DAILY is the directory where you want the daily notes to be.

Default editor is neovim from a binary file (because that is what i run)
To change editor, change the $editor environment variable in the script

## ff - Find File

ff is a script which takes you to the directory of the file you select.

[fzf](https://github.com/junegunn/fzf) is required.

## fvim - Find File vim

fvim is lets you edit the file you choose

[fzf](https://github.com/junegunn/fzf) is required.

## Other

Most of the other scripts are referenced externally on my machine.

- notifySuspend
    - send a notification that the system will suspend soon.
- i3lock
    - lock with wallpaper.
- batteryChecker
    - checks how much batteru is left.
