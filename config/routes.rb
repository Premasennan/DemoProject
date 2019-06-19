Rails.application.routes.draw do  
  root 'homes#index'
	get "sign_up", to: "registrations#new"
	post "sign_up", to: "registrations#create"
	get "sign_in", to: "sessions#new"
	post "sign_in", to: "sessions#create"
	delete "sign_out", to: "sessions#destroy"
end
