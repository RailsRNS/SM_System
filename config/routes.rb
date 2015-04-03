Rails.application.routes.draw do
  get 'teachers/index'

  get 'teachers/new'

  get 'teachers/create'

  get 'teachers/show'

  get 'teachers/edit'

  get 'teachers/update'

  get 'teachers/destroy'

  get 'students/index'

  get 'students/new'

  get 'students/create'

  get 'students/show'

  get 'students/edit'

  get 'students/update'

  get 'students/destroy'

  get 'sections/index'

  get 'sections/new'

  get 'sections/create'

  get 'sections/show'

  get 'sections/edit'

  get 'sections/update'

  get 'sections/destroy'

  get 'courses/index'

  get 'courses/new'

  get 'courses/create'

  get 'courses/update'

  get 'courses/show'

  get 'courses/edit'

  get 'courses/destroy'

  #resources :courses
  resources :courses do
    collection do
      get 'add_course_section'
      delete 'delete_course_sections'
    end

  end
  resources :sections
  root to: 'courses#index' # Default routes

  resources :students do
    collection do
      get 'relate_course_section'
      delete 'delete_course_sections_relation'
    end
  end

  resources :teachers do
    collection do
      get 'add_course_section'
      delete 'delete_course_section_relation'
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
