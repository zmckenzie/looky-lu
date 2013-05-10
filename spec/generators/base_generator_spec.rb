require 'spec_helper'
require 'generators/lookylu/base_generator'
require 'data/lu/states'
require 'app/models/State'

describe Lookylu::Generators::BaseGenerator do

  before(:each) do
    @gen = Lookylu::Generators::BaseGenerator.new
  end

  it 'should build file name' do
    @gen.object_name = 'ObjectName'
    @gen.file_name.should == 'object_name'
  end

  it 'should build model name' do
    @gen.object_name = 'object_name'
    @gen.model_name.should == 'ObjectName'
  end

  it 'should build plural name' do
    @gen.object_name = 'ObjectName'
    @gen.plural_name.should == 'object_names'
  end

  it 'should build plural model name' do
    @gen.object_name = 'object_name'
    @gen.plural_model_name.should == 'ObjectNames'
  end

end