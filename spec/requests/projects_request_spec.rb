require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  describe 'GET #index' do
    before { get '/projects' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns ok' do
      json_response = JSON.parse(response.body)
      expect(json_response).to eq('message' => 'ok')
    end
  end
end
