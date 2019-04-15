function spwgen
  head -n 32 /dev/urandom | shasum -a 256
end
