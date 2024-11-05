Timetracker::Engine.routes.draw do
  resources :tasks do
    resources :timers, shallow: true
  end

  root to: "tasks#index"
end
