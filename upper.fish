function upper
  awk '{print toupper($0)}' $argv
end
