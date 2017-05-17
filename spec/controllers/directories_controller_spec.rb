require 'rails_helper'

describe DirectoriesController, type: :controller do
  render_views

  describe '#index' do
    it 'should return json ldap data based on user input param' do
      user = create(:user)
      sign_in user

      get :show, params: { name: 'will', format: :json }

      expect(response).to be_success
    end

    it 'should return the correct data' do
      user = create(:user)
      sign_in user

      get :show, params: { name: 'Holt', format: :json }
      body = JSON.parse(response.body)

      expect(body.first['email']).to eq 'holtzapp@musc.edu'
      expect(body.first['name']).to eq 'Ashley Holtzapple'
    end
  end
end

