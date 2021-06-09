Rails.application.routes.draw do
  root :to => 'homes#top'
  get 'books' => 'books#index', as: 'books'
  get 'books/:id' => 'books#show', as: 'book'
  post 'books' => 'books#create'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
