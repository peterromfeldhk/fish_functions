function simpleserver
  set -l options (fish_opt -s h -l help)
  # set -l options $options (fish_opt -s s -l script --multiple-vals)
  set -l options $options (fish_opt -s p -l port)
  set -l options $options (fish_opt -s b -l bind)
  argparse $options -- $argv

  # FIXME: how to have default value OR pass arguments
  set -q _flag_bind; or set _flag_bind localhost
  set -q _flag_port; or set _flag_port 8080

  # https://www.tutorialspoint.com/http/http_responses.htm
  # https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages
  while true
    begin
      # Status-Line
      printf "HTTP/1.1 200 OK\r\n"
      # Headers
      printf "Content-Type: text/plain\r\n"
      ## this seperates Headers from Body
      printf "\r\n"
      # Body
      date
      # echo -e "$_flag_script"
    end | nc -l $_flag_bind $_flag_port
  end
end
