#!/usr/bin/env bash

# Credits: https://medium.com/hackernoon/customizing-tmux-b3d2a5050207
#  display the current battery percentage using the following command:

pmset -g batt | grep '[0-9][0-9]%' | awk 'NR==1{print$3}' | cut -c 1-3

# pmset is a mac specific command

# Also see gawk
# awk - A versatile programming language for working on files.
  # More information: <https://github.com/onetrueawk/awk>.
  # Print the fifth column (a.k.a. field) in a space-separated file:
  #     awk '{print $5}' filename
  # Print the second column of the lines containing "foo" in a space-separated file:
  #     awk '/foo/ {print $2}' filename

# grep  searches  for  PATTERNS  in  each  FILE.   PATTERNS  is one or more patterns separated by newline
# characters, and grep prints each line that matches a pattern.  Typically PATTERNS should be quoted when
# grep is used in a shell command.
  # Find patterns in files using regular expressions.
  # More information: <https://www.gnu.org/software/grep/manual/grep.html>.
  # Search for a pattern within a file:
  #     grep "search_pattern" path/to/file
  # Search for an exact string (disables regular expressions):
  #     grep --fixed-strings "exact_string" path/to/file
