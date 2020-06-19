require 'rails_helper'

RSpec.describe "projects/:id/todos", type: :request do
  include_context "with json response"

  let(:valid_attributes) { { text: 'Do something', isCompleted: false } }
  let(:invalid_attributes) { { text: '' } }

  let(:todo) { create(:todo, project: project) }
  let(:project) { create(:project) }

  describe "GET /index" do
    it "renders a successful response" do
      get project_todos_url(project)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get project_todo_url(project, todo)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:request) { post project_todos_url(project), params: { todo: valid_attributes } }

      it "creates a new Todo" do
        project
        expect { request }.to change(Todo, :count).by(1)
      end

      it "renders a JSON response with the new todo" do
        project
        request
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include("application/json")
        expect(body).to eq(
          valid_attributes.merge(id: Todo.last.id).with_indifferent_access
        )
      end
    end

    context "with invalid parameters" do
      let(:request) { post project_todos_url(project), params: { todo: invalid_attributes } }

      it "does not create a new Todo" do
        expect { request }.to change(Todo, :count).by(0)
      end

      it "renders a JSON response with errors for the new todo" do
        request
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "PATCH /update" do
    let(:request) { patch project_todo_url(project, todo), params: { todo: new_attributes } }

    before { request }

    context "with valid parameters" do
      let(:new_attributes) { { isCompleted: true } }

      it "updates the requested todo" do
        expect(todo.reload).to be_completed
      end

      it "renders a JSON response with the todo" do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include("application/json")
      end
    end

    context "with invalid parameters" do
      let(:new_attributes) { invalid_attributes }

      it "renders a JSON response with errors for the todo" do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested todo" do
      todo
      expect {
        delete project_todo_url(project, todo)
      }.to change(Todo, :count).by(-1)
    end
  end
end
