include:
  - common.packages
  - common.oh_my_zsh

zsh_rc:
  file.append:
    - name: /home/vagrant/.zshrc
    - text: |
        bindkey "^[[1~" beginning-of-line
        bindkey "^[[4~" end-of-line
        if [[ ! $TERM =~ "screen".* ]]; then
          tmux attach -t base || tmux new -s base
        fi

# vim remember last position

vim_rc:
  file.append:
    - name: /etc/vim/vimrc
    - text: |
        if has("autocmd")
          au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"%" | endif
        endif


# for testing run on the VM:
# sudo salt-call state.highstate
