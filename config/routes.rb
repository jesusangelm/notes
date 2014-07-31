Notepad::Application.routes.draw do

  get "map/index"
  use_doorkeeper
  devise_for :users

  resources :notes
  resources :profiles

  root 'high_voltage/pages#show', id: "index"

  namespace :api do
    namespace :v1 do
      resources :notes, except: [ :new, :edit ]
    end
  end

end
