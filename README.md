## What is it? ##

looky-lu will generate standard look up data abilities for your rails application

## What is it for? ##

Recently we went through the pain of having to create a look up table for the different states in the United States.

This gem will allow you to easily add that kind of data to your project

## How to use it ##

To create and populate a State model object

bundle exec rake lookylu:build:states
bundle exec rake db:migrate
bundle exec rake lookylu:populate:states