Notepad::Application.routes.draw do

  devise_for :users

  resources :notes
  resources :profiles

  root 'high_voltage/pages#show', id: "index"

end
