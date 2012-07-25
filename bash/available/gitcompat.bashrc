#
# Configure environment variables for better git output behavior
#

if [ -e $(which git) ]
then git config --global color.ui true
fi

export PAGER=less
export LESS="-iFXR"
