def set_terminal_prompt()
  `echo "" >> .bashrc`
  `echo 'PS1="\u[\W]: "' >> .bashrc`
end
