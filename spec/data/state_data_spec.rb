require 'spec_helper'
require 'data/lu/states'

describe LookyLu::States do

  describe 'from country' do

    it 'should pull only united states' do
      LookyLu::States.from_country('united_states').count.should == 51
    end

    it 'should pull only canada' do
      LookyLu::States.from_country('canada').count.should == 10
    end

    it 'should pull all' do
      LookyLu::States.from_country('all').count.should == 61
    end

  end

end
