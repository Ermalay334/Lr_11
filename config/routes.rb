Rails.application.routes.draw do
  root 'armst#input'
  get 'armst/view'
  get 'armst/input'
  get 'armst/results'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
