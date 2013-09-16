require 'spec_helper'

describe EventsController do
  describe 'GET #index' do
  	it 'responds successfully with an HTTP 200 status code' do
  		get :index

	  	expect(response).to be_success
	    expect(response.status).to eq(200)
  	end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end

    it 'loads all of the events into @events' do
    	event1, event2 = Fabricate(:event), Fabricate(:event)

    	get :index

    	expect(assigns(:events)).to match_array([event1, event2])
    end
  end

  describe '#new' do
  	it 'responds successfully with an HTTP 200 status code' do
	  	get :new

	  	expect(response).to be_success
	    expect(response.status).to eq(200)
  	end

    it 'renders the new template' do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe '#create' do
  	context 'when success' do
  		it 'responds successfully with an HTTP 200 status code' do
  		end

  		it 'redirects to events index' do
  			# test redirection
  			# test template?
  		end
  	end

  	context 'when failure' do
  		it 'responds with error and an HTTP 200 status code'
  	end
  end
end
