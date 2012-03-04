Brogrammers::Application.routes.draw do
  devise_for :brogrammers, skip: [:sessions, :registrations]
  as :brogrammer do
    get "/apply" => "devise/registrations#new", as: :new_brogrammer_registration
    post "/apply" => "devise/registrations#create", as: :brogrammer_registration
    get "/login" => "devise/sessions#new", as: :new_brogrammer_session
    post "/login" => "devise/sessions#create", as: :brogrammer_session
    delete "/login" => "devise/sessions#destroy"
  end

  resource :brogrammers

  root :to => 'home#index'
end
