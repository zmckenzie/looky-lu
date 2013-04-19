require 'spec_helper'
require 'generators/data'
require 'data/lu/states'
require 'app/models/State'

describe LookyLu::Generators::Data do

  before(:each) do
    LookyLu::Generators::Data.any_instance.stub(:db_config).and_return(database_config)
    @data_gen = LookyLu::Generators::Data.new
  end

  it 'should pluralize properly' do
    @data_gen.pluralize(0, 'state').should == '0 states'
    @data_gen.pluralize(1, 'state').should == '1 state'
    @data_gen.pluralize(2, 'state').should == '2 states'
  end

  it 'should find the correct class name' do
    @data_gen.class_name(State).should == 'state'
  end

  it 'should create the correct table name' do
    @data_gen.table_name(State).should == 'states'
  end

  it 'should pull the database configs' do
    pending 'How to test this?'
  end

  it 'should connect to the database' do
    pending 'How to test this?'
  end

  describe 'populate' do

    after(:each) do
      load_db
    end

    it 'should fail if table is not there' do
      connect_to_db
      ActiveRecord::Base.connection.drop_table @data_gen.table_name(State)

      expect {@data_gen.populate State, LookyLu::States.united_states}.
        to raise_error 'Table states does not exist. Please build the needed migration and migrate your database'
    end

    it 'should add object data' do
      Object.any_instance.should_receive(:puts).with("There are now #{@data_gen.pluralize(LookyLu::States.united_states.count, 'state')}")

      @data_gen.populate State, LookyLu::States.united_states
      State.count.should == LookyLu::States.united_states.count

    end
  end

end