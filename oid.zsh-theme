autoload -Uz vcs_info
precmd() {
  vcs_info
  zstyle ":vcs_info:git:*" formats "%b"

  prompt_segment() {
    echo -n "%{$fg[$1]%}%{$bg[$1]%}%{$fg_bold[$2]%} $3 %{$reset_color%}%{$fg[$1]%} "
  }

  prompt_whoami() {
    prompt_segment black white "%n@%m"
  }

  prompt_directory() {
    prompt_segment blue black "%~"
  }

  prompt_end() {
    echo -n "%{$fg[white]%}% %{$reset_color%}"
  }

  build_prompt() {
    prompt_whoami
    prompt_directory
    prompt_end
  }

  rprompt_git() {
    if [[ -n $vcs_info_msg_0_ ]]; then
      prompt_segment black white " ${vcs_info_msg_0_}"
    fi
  }

  rprompt_end() {
    echo "%{$fg[white]%}% %{$reset_color%}"
  }

  build_rprompt() {
    rprompt_git
    rprompt_end
  }

  PROMPT="$(build_prompt)"
  RPROMPT="$(build_rprompt)"
}