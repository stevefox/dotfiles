These are my dotfiles for a peek into how I manage my environment.


 - .bashrc: Contains tweaks and environment setup for software I use frequently
 - .emacs: My hand-crafted (slightly messy) emacs config file which I have been carting around for the past eight years.
 - .gitk: Some tweaks to make gitk fonts bigger and easier to read
 - .gitconfig: Some awesome aliases for using git. My favorites are:
   - git ds (stands for diff-staged): See the diff between most recent commit and staged. Useful to review staged changes prior to committing.
   - git df (stands for diff): A standard git diff
   - git popcommit: Pop (undo) the last commit. Really useful.
   - git sh: Gives a short sha1 hash to reference a specific commit.
 - i3config: maps to ~/.config/i3/config. Configuration file for i3 window manager, which is nice. Requires installing a few packages from apt:
    - i3-wm
    - suckess-tools
    - i3lock
    - i3status
    - network-manager-gnome
