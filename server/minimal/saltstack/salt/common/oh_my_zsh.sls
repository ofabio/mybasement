# Clone oh-my-zsh

oh_my_zsh:
  git.latest:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - target: /home/vagrant/.oh-my-zsh
    - require:
      - pkg: git
      - pkg: zsh

# Set ZSH as default shell

default_shell:
  cmd:
    - run
    - name: "chsh -s /usr/bin/zsh vagrant"
    - unless: "grep -E '^vagrant.+:/usr/bin/zsh$' /etc/passwd"
    - require:
      - pkg: zsh

# Copy template

/home/vagrant/.zshrc:
  file.copy:
    - source: /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template
    - require:
      - git: oh_my_zsh


#sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="3den"/g' ~/.zshrc
