[![Build Status](https://travis-ci.org/agapered/looky-lu.png?branch=master)](https://travis-ci.org/agapered/looky-lu)
[![Coverage Status](https://coveralls.io/repos/agapered/looky-lu/badge.png?branch=master)](https://coveralls.io/r/agapered/looky-lu?branch=master)


## What is it? ##

looky-lu will generate standard look up data abilities for your rails application

## What is it for? ##

Recently we went through the pain of having to create a look up table for the different states in the United States.

This gem will allow you to easily add that kind of data to your project

## How to use it ##

To create and populate a State model object

```console
rails g lookylu:state
rake db:migrate
 rails g lookylu:state_data State
```

## Additional Options ##

```console
rails g lookylu:state -h
```



