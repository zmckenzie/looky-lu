[![Build Status](https://travis-ci.org/agapered/looky-lu.png?branch=master)](https://travis-ci.org/agapered/looky-lu)
[![Coverage Status](https://coveralls.io/repos/agapered/looky-lu/badge.png?branch=master)](https://coveralls.io/r/agapered/looky-lu?branch=master)


## What is it? ##

looky-lu will generate standard look up data abilities for your rails application

## What is it for? ##

Recently we went through the pain of having to create a look up table for the different states in the United States.

This gem will allow you to easily add that kind of data to your project

## How to use it ##

To create and populate a State model object

```
rails g lookylu:state
rake db:migrate
rails g lookylu:state_data State
```

## Additional Options ##

```
rails g lookylu:state -h
```


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
