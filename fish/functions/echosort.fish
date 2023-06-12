function echosort --description "Echo a list variable in sorted order, one element per line"
  for el in $argv
    echo $el
  end | sort
end
