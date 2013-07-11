require 'spec_helper'

describe HomeController do

  describe :show do
    before { get :show }
    its(:response) { should be_success }
  end

end
