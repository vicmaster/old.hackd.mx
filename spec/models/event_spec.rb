require 'spec_helper'

describe Event do
  context 'validations' do
  	context 'when missing required fields' do
  		it 'should return a list of validation errors' do
	  		full_error_messages = [
	  			"Name can't be blank",
	  			"User can't be blank"
	  		]

        subject.should_not be_valid

	  		subject.errors.full_messages.should eql full_error_messages
	  	end
  	end

  	context 'when all required fields are given' do
  		it 'should have no errors' do
  			subject.name    = 'First meeting'
  			subject.user_id = 1

        subject.should be_valid

  			subject.errors.empty?.should be_true
  		end
  	end
  end
end
