[![Build Status](https://travis-ci.org/agapered/looky-lu.png?branch=master)](https://travis-ci.org/agapered/looky-lu)
[![Coverage Status](https://coveralls.io/repos/agapered/looky-lu/badge.png?branch=master)](https://coveralls.io/r/agapered/looky-lu?branch=master)


## What is it for? ##

LookyLu gives you easy ability to generate an ActiveRecord object for lookup data, as well as the ability to populate that object with data.

For example, you need a State object that is an LU table for all of the states in the United States, then this gem is perfect for you.

## How to use it ##

Using my example above of needing a State object:

Generate the ActiveRecord model and the needed migration
```
rails g lookylu:state
```

Migrate your database 
```
rake db:migrate
```

Populate the database with the 50 stats plus D.C.
```
rails g lookylu:state_data State united_states
```

## Additional Options ##

For generating the Model and migration
```
rails g lookylu:state -h
```

For generating the LU data
```
rails g lookylu:state_data -h
```

## Current LU Data Available ##

* ### State ###
    * United States
    * Canada


## Who are you? ##

We are [Agape Red](https://twitter.com/agape_red). [Check us out](http://agapered.com/)

## I'm a dev, I can help ##

Awesome! Thanks! Here are the steps I ask:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Make sure the tests pass (`bundle exec rspec`)
5. Coverage not 100%? Sounds like a problem
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
