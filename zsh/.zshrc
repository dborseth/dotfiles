source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle python
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle gradle
antigen bundle extract
antigen bundle node
antigen bundle npm

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle littleq0903/gcloud-zsh-completion
antigen bundle gko/ssh-connect

antigen theme refined

antigen apply

source ~/.zsh/aliases
source ~/.zsh/exports
source ~/.zsh/history

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/mnt/c/Users/danborse/dev/tools/google-cloud-sdk/path.zsh.inc' ]; then source '/mnt/c/Users/danborse/dev/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/mnt/c/Users/danborse/dev/tools/google-cloud-sdk/completion.zsh.inc' ]; then source '/mnt/c/Users/danborse/dev/tools/google-cloud-sdk/completion.zsh.inc'; fi
