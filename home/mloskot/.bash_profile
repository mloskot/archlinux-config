#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if type ssh-agent >/dev/null 2>&1; then
    eval $(ssh-agent)
fi
[[ -f ~/.ssh/id_rsa ]] && ssh-add ~/.ssh/id_rsa
[[ -f ~/.ssh/id_rsa.gh ]] && ssh-add ~/.ssh/id_rsa.gh
[[ -f ~/.ssh/id_rsa.brzuchol ]] && ssh-add ~/.ssh/id_rsa.brzuchol
