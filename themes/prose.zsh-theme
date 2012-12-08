#!/bin/sh
typeset -A altchar
set -A altchar ${(s..)terminfo[acsc]}
PR_SET_CHARSET="%{$terminfo[enacs]%}"
draw_on="%{$terminfo[smacs]%}"
draw_off="%{$terminfo[rmacs]%}"
draw_hbar=${altchar[q]:--}
draw_ul=${altchar[l]:--}
draw_ll=${altchar[m]:--}
draw_lr=${altchar[j]:--}
draw_ur=${altchar[k]:--}

PROMPT='%{$fg[blue]%}$draw_on$draw_ul$draw_hbar$draw_off%{$reset_color%}\
[%{$fg[green]%}%n%{$reset_color%}] \
%{$fg[magenta]%}at%{$reset_color%} \
[%{$fg[yellow]%}%m%{$reset_color%}] \
%{$fg[magenta]%}in%{$reset_color%} \
[%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}]$(git_prompt_info)
%{$fg[blue]%}$draw_on$draw_ll$draw_hbar$draw_off%{$fg[yellow]%}>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}on%{$reset_color%} [%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT=''
