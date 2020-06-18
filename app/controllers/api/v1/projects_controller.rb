class Api::V1::ProjectsController < ApplicationController
  def index
    render json: { message: 'ok' }
  end
end
