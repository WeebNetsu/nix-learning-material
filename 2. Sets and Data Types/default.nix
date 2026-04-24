# sets are very similar to JSON, it is a collection of name and value pairs

{
  # in json this would be { "string": "A piece of text", }
  string = "A piece of text";
  integer = 55;
  float = 3.1415;
  bool = false;
  # notice how some keywords are allowed as names here
  null = null;
  list = [
    9
    null
    "some text"
  ];
  # notice how "-" is allowed
  attribute-set = {
    nim = 7;
    go = 5;
    javascript = 10;
  };
  # nesting can also be done with "."
  x.y.z = "deeply nested structure";

  # a recursive set allows you to access values you set inside the set
  recursive-set = rec {
    speed = 60;
    time = 1.5;
    # speed and time are bot accessible here thanks to the recursive set
    # also * is times, / divide, + add, - subtract
    distance = speed * time;
  };
}
