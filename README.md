# batchGit

* You add a list of directories in a file
* batchGit basically goes through each directory and runs `autoGit`
* What is `autoGit`? 
    * It basically just does the usual git add, commit, pull, push
    * Useful when you expect no merge conflicts etc.
    * Helps keep things in sync

## Setup

1. Fork the repository

2. Edit the `config.conf` file (you can customise as you need)

    ```
    ROOT_DIR="/Users/incompetence/Documents/GitHub"
    ROOT_BATCHGIT="/Users/incompetence/Documents/GitHub/batchGit"
    SCRIPT_PATH="$ROOT_BATCHGIT/autoGit.sh"
    DIR_LIST="$ROOT_BATCHGIT/dirs.txt"
    ```

    where 
        * The script looks for folders in `$ROOT_DIR`
        * The `batchGit` file sits in `$ROOT_BATCHGIT`
        * The autoGit file is being run from `$SCRIPT_PATH`
        * The directories are being taken from `$DIR_LIST`

    Once customised, copy it as follows:

    ```mkdir ~/.config/batchGit && cp config.conf ~/.config/batchGit/config.conf```

3. Update `dirs.txt` as needed (list the folders relative to `$ROOT_DIR`)

4. Add the executable to the environment so you don't have to cd your way into projLaunch. 
    For instance, something like the following
    ```sudo ln -s /location/to/where/you/cloned/batchGit/batchGit.sh /usr/local/bin/batchGit```



## Usage

You should now be able to launch

```batchGit```

from your terminal.


* TIP: It may help to launch a new Terminal window, so that all the subprocesses are launched as tabs within this window. 

* TIP2: It may also help to navigate to `Terminal»Settings»Profiles»Shell` and say "Ask before closing: Never". This will make it easier to quit all the processes by killing the window you ran `batchGit` from.