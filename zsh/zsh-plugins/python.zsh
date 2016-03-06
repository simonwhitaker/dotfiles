export VIRTUAL_ENV_DISABLE_PROMPT=1
export WORKON_HOME=$HOME/.virtualenvs
vew_bootstrap=/usr/local/bin/virtualenvwrapper.sh
if [[ -a $vew_bootstrap ]]
then
    source $vew_bootstrap
fi
