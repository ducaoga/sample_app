Rails.application.routes.draw do
  get 'user/new'

  root 'static_pages#home'
  get '/contact', to:'static_pages#contact'
#  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get  '/signup',  to: 'user#new'

end
