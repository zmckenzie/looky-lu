require 'spec_helper'
require 'data/lu/states'

describe LookyLu::States do

  describe '#canada' do
    it 'should retun all 10 provinces' do
      LookyLu::States.canada.count.should == 10
    end
  end

  describe '#united_states' do
    it 'should return all 50 states and DC' do
      LookyLu::States.united_states.count.should == 51
    end
  end

  describe '#all' do
    it 'should return all provinces and states' do 
      LookyLu::States.all.count.should == 61
    end
  end

end