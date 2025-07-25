# Scripts

This is a collection of scripts to improve my terminal workflow.

To install, clone the repo, and add
~~~bash
source <location of repo>/zsh
~~~

to your bashrc or zshrc.
#!(all scripts run as #!/bin/bash)

# The scripts

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

## podmaninator - fuzzy selection of podman containers

lets you fuzzy select from podman containers, starts the container its command 

~~~
pd
~~~

## toolbox

lets you quickly search your toolbox directory and open

requirements: bat and nvim
*alternatively you can change the preview and editor variables to some other programs you prefer*

~~~
tb
~~~

**examples** of toolbox notes can be found at https://github.com/TheSkibb/toolbox

you can also quickly add new tools by adding the argument n

~~~bash
tb n
~~~

First you will be promted for a file name. All spaces will be replaced with dashes, and a .md extension will be added.
Then that filename will be opened with your editor (nvim by default)

## dn - Daily Note

~~~bash
dn
~~~
Opens a markdown file for daily note.

~~~bash
wn
~~~
Opens a markdown file for weekly note.

To change the date and week format of the notes change the $DAILY_FORMAT and $WEEKLY_FORMAT variables.

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

## gd - Git Diff (diffinator)

pipes git diff into fzf with a preview of the diff in question

when selecting a diff it will run git diff for that file, so you can inspect the whole thing

mapped to *gd*

[fzf](https://github.com/junegunn/fzf) and git is required.

## cht - search cheat.sh

bat is required, or change the *display_program* variable

~~~
cht
~~~

then input the command/program/concept to search for

## Other

Most of the other scripts are referenced externally on my machine.

- notifySuspend
    - send a notification that the system will suspend soon.
- i3lock
    - lock with wallpaper.
- batteryChecker
    - checks how much batteru is left.
- newTask
    - script to create tasks in neovim
