# nix eval -f main.nix    or   nix-instantiate --eval --strict main.nix
# or
# nix repl  - if you want to run it in the terminal without a file

# naming a file default.nix allows you to skip the file name when running the file
# nix-instantiate --eval --strict
# or
# nix eval -f folderName (no file name needed)

# basic hello world script

# below works, but you cannot add any additional commands
# "Hello World"

# allows you to run multiple lines, but will of course output
# the result in [ ]
# [
#   "Hello World"
#   # brackets () required
#   (1 + 2)
#   true
#   3.1415
# ]

# alternatively named outputs, will output in a { }
{
  message = "Hello World";
  calc = 1 + 2;
  isOld = true;
  pi = 3.1415;
}

# the reason we use --strict in nix-instantiate --eval --strict is because by
# default nix does lazy evaluation, so it only computes values when it needs to
# by specifying --strict, we tell it to compute everything
# so without strict you'll see this

# { calc = <CODE>; isOld = true; message = "Hello World"; pi = 3.1415; }
# instead of
# { calc = 3; isOld = true; message = "Hello World"; pi = 3.1415; }
