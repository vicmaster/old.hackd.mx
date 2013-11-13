require 'spec_helper'

describe EventsController do
  def valid_attributes
    {
      name: 'test',
      details: 'test',
      location_name: 'test_location'
    }
  end
  let(:event){ Fabricate :event }
  let(:user){ event.user }

  before do
    controller.stub(:current_user).and_return user
  end

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

      expect(assigns(:events)).to include(event1, event2)
    end
  end

  describe '#new' do
    before do
      get :new
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'renders the new template' do
      expect(response).to render_template("new")
    end
  end

  describe '#create' do
    context 'when success' do
      it 'redirects to events index' do
        post :create, { event: valid_attributes }

        expect(response).to redirect_to events_path
      end
    end

    context 'when is invalid' do
      it 'should not redirect to events index' do
        post :create, { event: { name: ''} }

        expect(response).to render_template 'new'
      end
    end
  end

  describe '#edit' do
    it' should edit a event' do
      get :edit, { id: event.to_param }

      expect(response).to render_template("edit")
    end
  end

  describe '#update' do
    context 'valid information' do
      it 'redirects to index page' do
        put :update, { event: event.attributes, id: event.to_param }

        expect(response).to redirect_to events_path
      end
    end

    context 'invalid information' do
      it 'renders the edit page' do
        params = { id: event.to_param, event: { name: nil } }
        put :update, params

        expect(response).to render_template("edit")
      end
    end

  end

end
