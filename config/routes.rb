Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'index#index'

  get 'forbidden' => 'index#forbidden'
  get 'til' => 'index#til'

  get '/:site' => 'index#site'
end
