Timetracker::Engine.routes.draw do
  resources :tasks

  root to: "tasks#index"
end
