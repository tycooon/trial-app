App::Application.routes.draw do
  match 'app' => 'app#index'
  resources :statements
end
