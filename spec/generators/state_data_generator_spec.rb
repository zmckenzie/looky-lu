require 'spec_helper'
require 'generators/lookylu/state_data_generator'
require 'data/lu/states'
require 'app/models/State'

describe Lookylu::Generators::StateDataGenerator do

  before(:each) do
    @gen = Lookylu::Generators::StateDataGenerator.new
    @gen.object_name = 'State'
  end

  it 'should pull the database configs' do
    Rails.should_receive(:configuration).and_return(double('configuration', database_configuration: {}))
    @gen.send(:db_config)
  end

  it 'should connect to the database' do
    pending 'How to test this?'
  end

  describe 'populate data' do

    before(:each) do
      Lookylu::Generators::StateDataGenerator.any_instance.stub(:db_config).and_return(database_config)
    end

    after(:each) do
      load_db
    end

    it 'should fail if table is not there' do
      @gen.send(:connect_to_db)
      ActiveRecord::Base.connection.drop_table @gen.plural_name

      expect {@gen.populate_data}.
        to raise_error "Table #{@gen.plural_name} does not exist. Please build the needed migration and migrate your database"
    end

    context 'canada' do
      it 'should add object data' do
        Object.any_instance.should_receive(:puts).with("There are now #{@gen.pluralize(LookyLu::States.canada.count, @gen.plural_model_name)}")

        @gen.country_name = 'CA'
        @gen.populate_data
        State.count.should == LookyLu::States.canada.count
      end
    end

    context 'US' do
      it 'should add object data' do
        Object.any_instance.should_receive(:puts).with("There are now #{@gen.pluralize(LookyLu::States.united_states.count, @gen.plural_model_name)}")

        @gen.country_name = 'US'
        @gen.populate_data
        State.count.should == LookyLu::States.united_states.count
      end
    end

    context 'all' do
      it 'should add object data' do
        Object.any_instance.should_receive(:puts).with("There are now #{@gen.pluralize(LookyLu::States.all.count, @gen.plural_model_name)}")

        @gen.country_name = 'all'
        @gen.populate_data
        State.count.should == LookyLu::States.all.count
      end
    end

    it 'should not fail if object does not exist' do
      @gen.object_name = 'no_model'
      expect {@gen.populate_data}.
        to raise_error "Could not find object for #{@gen.model_name}"
    end

  end

end