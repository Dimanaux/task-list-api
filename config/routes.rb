Rails.application.routes.draw do
  resources :projects, defaults: { format: 'json' } do
    resources :todos, module: :projects
  end
end
