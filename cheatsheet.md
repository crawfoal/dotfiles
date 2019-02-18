# Amanda's Master Cheat Sheet
A cheatsheet showing my key bindings for the stuff I do most often.

## Terminal
- Delete from cursor to end of line
    Cmd + K
- Delete from cursor to beginning of line
    Cmd + U
- Move to end of line
    Cmd + A
- Move to beginning of line
    Cmd + E

## Vim
- Write buffer (when in insert mode, exit first)
    Ctrl + s

### File Exploring
- Open netrw window
    :e .
- Edit file under cursor or open the directory
    <cr>
- Go up a directory
    -

### Visual Block
- Enter
    Ctrl + v
- Insert
    I
- Change
    C

### Moving Around
- Jump to character, say "
    f" (F" goes backwards)
- Jump just until a character, say "
    t" (T" goes backwards)
- For the above two, repeate search / opposite direction
               ;                    /        ,
- Top of screen (high) / middle of screen / bottom of screen (low)
          H            /        M         /         L
- Scroll down half a screen / scroll up half a screen
        Ctrl + d            /     Ctrl + u
- Move current line to top / middle / bottom
          zt               /   zz   /   zb

### Commands
- Indent
    >
- Re-format / Fix indentation and break long lines
    =
- Change (deletes and then brings you into insert mode)
    c
- Repeate previous command
    .
- Yank
    y
- Visual select
    v

### Text Objects
- A word (includes spaces)
    aw
- Inner word (does not includes spaces)
    iw
- A paragraph
    ap
- Inner paragraph
    ip
- Inner parentheses (works for other surrounds as well, even HTML tags)
    i(
- A tag (includes the tags as well)
    at

### Splits
#### Creating Splits
- Create a split with buffer 2 (number from :ls)
    :sb2
#### Resizing Splits
- Maximize the current split
    Ctrl + w -
- Max out the height of the current split
    Ctrl + w _
- Max out the width of the current split
    Ctrl + w |
- Normalize all split sizes, which is very handy when resizing terminal
    Ctrl + w =
#### Moving Between Splits
Use Ctrl h, j, k, l just like vim text navigation.

### Tabs
- Break a split out into a new tab
    Ctrl + w T
- Go to next tab
    gt
- Go to previous tab
    gT

### CtrlP
- Move up or down in results list
    <C-k> / <C-j>
- Cycle through previous CtrlP searches
    <C-p> / <C-n>
- Open the highlighted file in a new tab
    <C-t>
- Open the highlighted file in a new split
    <C-s>
- Open the highlighted file in a new vertical split
    <C-v>

### Vim Surround
- Delete surrounding {char}
    ds{char}
- Replace surrounding {char} with {new char}
    cs{char}{new char}
- Surround text-object with {char}
    ys{text-obj}{char}

### Vim Commentary
- Comment by movement or text object
    gc{movement or text object}

### Vim Tmux Runner
- Send current line (or selection) to the tmux pane for evaluation
    :VtrSendLinesToRunner
- Prompt for pane number that VTR should attach to
    :VtrAttachToPane
- Send a specific command
    :VtrSendCommand
- Send entire file to be evaluated
    :VtrSendFile
- Make the tmux runner pane active and zoom it
    :VtrFocusRunner
- Open and attach a new tmux pane
    :VtrOpenRunner

### Vim Test
- Run the test nearest to the cursor
    t <C-n>
- Run all tests in the file
    t <C-f>
- Run the whole test suite
    t <C-s>
- Run the last test
    t <C-l>
- Go to the test file for the last test that was run
    t <C-g>

## Tmux
- Quick view of key bindings in a temporary pane
    <prefix> ?
- List commands
    `$ tmux list-commands`

### Panes
#### Creating Panes
- Vertical split
    <prefix> -
- Horizontal split
    <prefix> \
#### Moving Between Panes
Ctrl + {h, j, k, l} just like vim text navigation.
#### Resizing Panes
- Fine adjustment
    Shift + arrow
- Coarse adjustment
    Ctrl + arrow
- Zoom toggle
    <prefix> z
#### Moving Panes
- Flash pane numbers
    <prefix> q
- Move pane index down
    <prefix> {
- Move pane index up
    <prefix> }

### Windows
#### Creating Windows
- Brand new window
    <prefix> c
- Break current pane out into new window
    <prefix> b
#### Moving Between Windows
- Move to window number n
    <prefix> {n}

### Sessions
- New session with name of current directory (see ~/dotfiles/tat)
    `$ tat`
- Detach from current session
    <prefix> d
- List sessions
    `$ tmux ls`
- Interactively view session and window list, and choose one
    <prefix> j
    `$tmux choose-tree`
- Move to last session
    <prefix> L
- Break pane out into new session
    <prefix> C-b
- Kill current session and switch to another
    <prefix> K

### Custom
- Open a new pane to view/edit this cheatsheet
    <prefix> h

