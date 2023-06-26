Rails.application.routes.draw do
  resources :teachers do
    resources :teacher_subjects, shallow: true
  end
  resources :subjects
  resources :enrollments
  get "/download_pdf", to: "enrollments#download_pdf"
  root to: 'enrollments#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
