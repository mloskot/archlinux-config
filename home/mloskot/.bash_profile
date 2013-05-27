#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
eval $(ssh-agent)
[[ -f ~/.ssh/id_rsa ]] && ssh-add ~/.ssh/id_rsa
[[ -f ~/.ssh/id_rsa.gh ]] && ssh-add ~/.ssh/id_rsa.gh
[[ -f ~/.ssh/id_rsa.brzuchol ]] && ssh-add ~/.ssh/id_rsa.brzuchol
