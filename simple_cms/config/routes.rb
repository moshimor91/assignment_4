Rails.application.routes.draw do

  #get 'demo/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'subjects#index'

  resources :subjects do
    member do
      get :delete
    end
  end


  get 'demo/index'

  get 'demo/hello'

  get 'demo/other_hello'

  get 'demo/lynda'
  # Default route
  # may go away in future versions of Rails
  #get ':controller(/:action(/:id))'
end
