# sets are very similar to JSON, it is a collection of name and value pairs

{
  # in json this would be { "string": "A piece of text", }
  string = "A piece of text";
  integer = 55;
  float = 3.1415;
  bool = false;
  # notice how some keywords are allowed as names here, however, others like `let` are not allowed
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

  let-example =
    let # like defining variables
      var = 2;
    in
    # note that the `var` variable is only available inside this `in` statement
    var;

  # not available as the in statement has ended (;)
  # letOutsideExample = var;

  bigger-let-example =
    let
      # can hold multiple variables
      tickets = 270;
      ticketPrice = 150;
    in
    tickets * ticketPrice;

  set-let-example =
    let
      # it can of course also hold sets
      grades = {
        one = 50;
        two = 20;
        three = 30;
        four = 60;
        five = 89;
        six = 72;
        seven = 34;
        eight = 100;
        nine = 89;
        ten = 58;
        eleven = 47;
      };
    in
    # can also hold sets we use a recursive set just so we can mix and match our skills a bit,
    # does not need to be a recursive set can be a regular set
    rec {
      highest-grade = grades.eight;
      lowest-grade = grades.two;
      average =
        # with allows us to exclude the `grades` attributes, so we don't have to type out grades.one grades.two
        with grades; (one + two + three + four + five + six + seven + eight + nine + ten + eleven) / 11;
      range = highest-grade - lowest-grade;
    };

  inheritance-example =
    let
      age = 25;
      name = "Mike";
      hobby = "gaming";
      features = {
        rich = true;
        athletic = false;
      };
      skills = {
        math = true;
        science = false;
        geography = true;
        computer-science = true;
        spanish = false;
      };
    in
    {
      # inherit allows us to assign a value from something in the existing scope with the same name
      inherit age name hobby; # shorthand for age = age; name = name; hobby = hobby;
      # inherit from a set, but don't include the set
      inherit (features) rich athletic; # shorthand for rich = features.rich; athletic = features.athletic;

      best-skills =
        let
          # you can also use inherit inside of let
          inherit (skills) math geography computer-science;
        in
        {
          can-calculate = math;
          can-read-maps = geography;
          can-code = computer-science;
        };
    };

}
