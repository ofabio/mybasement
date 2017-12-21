include:
  - common.packages
  - common.oh_my_zsh

#zsh_install:
#  cmd.run:
#- user: vagrant
#   git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
#    #sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="3den"/g' ~/.zshrc

zsh_rc:
  file.append:
    - name: /home/vagrant/.zshrc
    - text: |
        bindkey "^[[1~" beginning-of-line
        bindkey "^[[4~" end-of-line
        if [[ ! $TERM =~ "screen".* ]]; then
          tmux attach -t base || tmux new -s base
        fi
#    - require:
#      - file: /home/vagrant/.zshrc
#      - cmd: oh_my_zsh_template

vim_rc:
  file.append:
    - name: /etc/vim/vimrc
    - text: |
        if has("autocmd")
          au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"%" | endif
        endif


# sudo su
# salt-call state.highstate
