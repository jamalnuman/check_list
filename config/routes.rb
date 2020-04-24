# Rails.application.routes.draw do
#   devise_for :users
#   #provides routes for the user controller 
#  resources :items do
#     member do 
#       patch :complete
#       # :complete refers to the complete method in the items controller
#     end
#   end
#  # provides routes for the items controller
#  root 'items#index'
#  #root route. controller to index action
# end
Rails.application.routes.draw do
  devise_for :users
  resources :items do
    member do
      patch :complete
    end
  end
  root 'items#index'
end