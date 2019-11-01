Rails.application.routes.draw do

  get 'expenses_tracker/myExpenses'
  root :to => 'session#new' # the root will point to the home action of the Pages controller            
  get '/login' => 'session#new'         # This will be our sign-in page.
  post '/login' => 'session#create'     # This will be the path to which the sign-in form is posted
  delete '/login' => 'session#destroy'  # This will be the path users use to log-out.
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/user' => 'users#show'
  patch '/users/:id/edit' => 'users#update'
  resources :users, except: [:index, :update]
  resources :expenses
  resources :categories
end
