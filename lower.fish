function lower
  awk '{print tolower($0)}' $argv
end
