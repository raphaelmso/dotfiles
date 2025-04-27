#!/bin/bash

file=`mktemp`.sh
tmux capture-pane -pS -50000 > $file
tmux new-window -n:mywindow "hx $file"
