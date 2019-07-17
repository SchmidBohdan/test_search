Rails.application.routes.draw do
  resources :programming_languages

  # get '/programming_languages', to: redirect('/show_results', status: 302)
  get '/show_results', to: 'programming_languages#show_result'
end
