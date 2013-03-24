#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa.gh
ssh-add ~/.ssh/id_rsa.brzuchol
