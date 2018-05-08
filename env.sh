
###################### GIT PARAMETERS #####################################


export PARENT_DIR=GIT_PARENT_DIR
export REPO_NAME=GIT_REPO_NAME
export BRANCH_NAME=GIT_BRANCH_NAME
export USER=GIT_USER
export EMAIL=GIT_EMAIL
export ACCESS_TOKEN=GITHUB_ACCESS_TOKEN
# GITHUB_ACCESS_TOKEN = personal access token from Github developer settings
export USER_UPSTREAM=GIT_USER_UPSTREAM


############################################################################
#### DO NOT EDIT BELOW THIS LINE: derived variables
############################################################################

#export GIT_REMOTE_URL=git@github.com:$GIT_USER/$GIT_REPO_NAME.git
export GIT_REMOTE_URL_HTTPS=https://github.com/$GIT_USER/$GIT_REPO_NAME.git
export GIT_REMOTE_UPSTREAM=$GIT_USER_UPSTREAM/$GIT_REPO_NAME


####################### Git Repo where notebooks will be pushed ############
cd $PARENT_DIR && git clone $GIT_REMOTE_URL_HTTPS


####################### Change in jupyter config ###########################
if [ ! -f ~/.jupyter/jupyter_notebook_config.py ]; then
   jupyter notebook --generate-config
fi

echo 'c.NotebookApp.disable_check_xsrf = True' >> ~/.jupyter/jupyter_notebook_config.py

#cp $GIT_PARENT_DIR/jupyter_github/config ~/.ssh/config
