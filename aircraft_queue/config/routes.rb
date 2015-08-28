Rails.application.routes.draw do
	
  root 'static_pages#home'

  get 'boot' => 'static_pages#boot'
  get 'flight_queues' => 'flight_queues#index'
  get 'dequeue_flight' => 'flight_queues#dequeue_flight'

  resources :aircrafts

end
