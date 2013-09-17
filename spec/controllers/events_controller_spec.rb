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
  		it 'redirects to events index' do
        post :create, event: {
          name: 'Hackd',
          details: 'Hackd this wednesday',
          location_name: 'Baticueva'
        }

        expect(response).to be_success
        expect(response.status).to eq(200)
  		end
  	end

    context 'when failure' do
      it 'should not redirect to events index' do
        count = Event.count
        post :create, event: {
          name: '',
          details: '',
          location_name: ''
        }

        assert Event.count == count, 'Something went wrong'
      end
    end
  end

  describe '#edit' do
    it' should edit a event' do
       event = Event.create(
          name: 'test',
          id: 1,
          details: 'test',
          location_name: 'test_location'
        )

        get :edit, id: event.id
        expect(response).to render_template("edit")
    end
  end

  describe '#update' do
    before do
      @event =  Event.create(
        name: 'test',
        id: 1,
        details: "test",
        location_name: "test_location"
      )
    end

    context 'valid information' do
      it 'redirects to index page' do
        put :update, id: @event.id, event: {
          name: 'test',
          id: 1,
          details: 'test',
          location_name: 'test_location'
        }
        expect(response).to redirect_to events_path
      end
    end

    context 'invalid information' do
      it 'renders the edit page' do
        put :update, id: @event.id, event: { name: '' }

        expect(response).to render_template("edit")
      end
    end

  end

end
