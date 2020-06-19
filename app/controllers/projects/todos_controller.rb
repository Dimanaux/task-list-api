class Projects::TodosController < ApplicationController
  expose :project, id: -> { params[:project_id] }
  expose :todos, from: :project
  expose :todo, parent: :project

  def index
  end

  def show
  end

  def create
    if todo.save
      render :show, status: :created
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def update
    if todo.update(todo_params)
      render :show
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  delegate :destroy, to: :todo

  private

  def todo_params
    params.require(:todo).permit(:text, :isCompleted).to_h
          .transform_keys(&:underscore)
  end
end
