function simpleserver
  set -l options (fish_opt -s h -l help)
  # set -l options $options (fish_opt -s s -l script --multiple-vals)
  set -l options $options (fish_opt -s p -l port --required-val --long-only)
  argparse $options -- $argv

  while true
    begin
      echo -e "HTTP/1.1 200 OK\r\n"
      date
      # echo -e "$_flag_script"
    end | nc -l $_flag_port
  end
end
