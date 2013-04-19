require 'spec_helper'
require 'data/lu/states'
require 'app/models/State'

describe State do

  describe 'scopes' do
    before(:each) do
      LookyLu::States.united_states.take(10).each do |s|
        State.where(s).first_or_create
      end
    end

    it 'should find by abbreviation' do
      State.for_abbreviation('AL').count.should == 1
    end

    it 'should find by name' do
      State.for_name('Alabama').count.should == 1
    end
  end

end