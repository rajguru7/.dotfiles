
# ZSH

setting up zsh like oh-my-zsh: [[1]][ext1]
run-help is for help on zsh builtins[[2]][ext2] 
In debian systems the run-alias is already unaliased by /etc/zshrc [[3]][ext3]

Taken snippets from zshrc and zsh files of kali linux.

```zsh
setopt aliases #To allow aliases in fzf config scripts. This does not work because 
               #fzf scripts disable aliases explicitly in its scripts
```

## NVIM LSP

cargo (rust) -> asm-lsp
sdkman (java) -> jdtls
nvm (node) -> bashls, pyright, copilot

Some considerations:

1. I want my shell to be fast. Loading multiple lsps requires zshrc to load
   environment variables which leads to slower shell startup.
1. Keeping copilot, python and bash lsps as they are used frequently.
1. If I want to develop in some language - I should be able to load the lsp only
   for that project and not on my whole system.
    * For now I'll use vscode for bulky work (project work, etc)
    * vscode has ai capabilties, better lsps for some languages (c, c++, python)

What you want is to change the zshrc whenever you need the feature.
For example:

I am using nvm to load node path. But I don't need to keep changing the node
version on my system frequently. So I don't need nvm at all times. So I
commented out the NVM load and just kept the direct path. If there is a phase of
life when I am experimenting a lot with node versions, I can uncomment the nvm
load.

Or use lazyloading for the nvm load.

```
# Node - nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/home/killua/.nvm/versions/node/v21.6.2/bin:$PATH"
```

## References

[ext1]: https://dev.to/rossijonas/how-to-set-up-history-based-autocompletion-in-zsh-k7o
[ext2]: https://stackoverflow.com/questions/4405382/how-can-i-read-documentation-about-built-in-zsh-commands
[ext3]: https://superuser.com/questions/1600089/how-can-i-add-run-help-to-zshrc-without-errors
