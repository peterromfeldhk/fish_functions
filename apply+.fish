function apply+
  xargs -n 1 | paste -sd+ - | bc
end
