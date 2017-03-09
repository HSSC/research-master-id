require 'rails_helper'

describe DirectoriesController, type: :controller do
  render_views

  describe '#index' do
    it 'should return json ldap data based on user input param' do
      user = create(:user)
      sign_in user

      get :show, format: :json, name: 'will'

      expect(response).to be_success
    end

    it 'should return the correct data' do
      user = create(:user)
      sign_in user

      get :show, format: :json, name: 'Holt'
      body = JSON.parse(response.body)

      expect(body.first['email']).to eq 'holtd@musc.edu'
      expect(body.first['name']).to eq 'David Holt'
    end
  end
end

