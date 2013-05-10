require 'spec_helper'
require 'generators/lookylu/state_generator'
require 'data/lu/states'
require 'app/models/State'
require 'fileutils'


describe Lookylu::Generators::StateGenerator do

  before(:each) do
    @gen = Lookylu::Generators::StateGenerator.new
    @gen.object_name = 'ObjectName'
  end
  #.send(:method_name, args)

  it 'should get model location' do
    @gen.send(:model_location).should == "app/models/ObjectName.rb"
  end

  it 'should get migration_location' do
    version = '12345'
    @gen.send(:migration_location, version).should == "db/migrate/#{version}_lookylu_create_object_names.rb"
  end

  it 'should build next migration number' do
    time = Time.new('2013-05-10 19:58:31 +0000')
    Time.should_receive(:now).and_return(time)
    @gen.send(:next_migration_number).should == 20130101000000
  end

  describe 'file create' do

    after(:each) do
      FileUtils.rm_rf 'spec/testing'
    end

    it 'should generate model file' do
      @gen.stub(:model_location).and_return("spec/testing/#{@gen.model_name}.rb")
      @gen.generate_model
      File.exists?("spec/testing/#{@gen.model_name}.rb").should be true
    end

    it 'should generate the migration file' do
      @gen.stub(:migration_location).and_return("spec/testing/#{20130101000000}_lookylu_create_#{@gen.plural_name}.rb")
      @gen.generate_migration
      File.exists?("spec/testing/#{20130101000000}_lookylu_create_#{@gen.plural_name}.rb").should be true
    end

  end



end
