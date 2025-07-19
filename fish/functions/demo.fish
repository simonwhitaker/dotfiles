function demo
  if set -q SW_SIMPLE_PROMPT
    set -e SW_SIMPLE_PROMPT
  else
    set -g SW_SIMPLE_PROMPT
  end
end
