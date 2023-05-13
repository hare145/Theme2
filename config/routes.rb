Rails.application.routes.draw do
  get '/' => 'homes#top'
  get 'book' => 'books#index'
  post 'books' => 'books#create'
  get  'books' => 'books#index'
  get 'books/new'
  get 'books/:id' => 'books#show', as: 'bookid'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
