require 'rails_helper'

RSpec.describe 'projects', type: :request do
  include_context 'with json response'

  let(:valid_attributes) { attributes_for(:project) }
  let(:project) { create(:project, title: 'Conquer the world') }
  let(:todo) { create(:todo, text: 'Start with default city', project: project) }

  describe 'GET /index' do
    let(:fixture_path) { 'projects_index.json' }
    let(:fixture_params) { { project_id: project.id, todo_id: todo.id } }

    before do
      todo
      get projects_url
    end

    it 'renders projects with todos' do
      expect(response).to have_http_status(:success)
      expect(body).to match(fixture)
    end
  end

  describe 'POST /index' do
    let(:request) { post projects_url, params: { project: valid_attributes } }

    it 'creates project' do
      expect { request }.to  change(Project, :count).by(1)
    end
  end
end
