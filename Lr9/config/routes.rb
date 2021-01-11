Rails.application.routes.draw do
  get '', to: 'index#input'
  get '/index/output' => 'index#output'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
