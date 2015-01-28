Rails.application.routes.draw do

  get 'postcode/postcode'

  get 'welcome/index'

  get 'thankyou/thankyou'

  get 'studentsanswers/studentsanswers'

  get 'candidatesanswers/candidatesanswers'

  get 'student_questions/studentquestions'

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self)

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

root to: 'home#index'

get 'quizmaster/constituency_one_candidate' => 'quizmaster#constituency_and_one_candidate_from_postcode'
get 'quizmaster/constituency_all_candidates' => 'quizmaster#constituency_and_candidates_from_postcode'
get 'users/thankyou' => 'users#thankyou'
get 'postcode' => 'home#postcode'

resources :questions
resources :candidates

resources :candidates do
  resources :answers 
  resources :questions do
    collection do
      get 'unanswered'
      get 'answered'
      get 'random_unanswered'
    end
  end
end



resources :constituencies do
  resources :candidates
end

# to refactor:

resources :users do 
  resources :candidates do
    get 'show_answered_asks'
    resources :asks do
      # collection { get 'student_show_answered_asks' }
    end
  end
end


root to: 'dashboard#index', as: '/'
  namespace :admin do
    get '', match '/admin' to: 'dashboard #index'
    resources :questions, :users
  end

# Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end



# namespace :admin do
#   get '', to: 'dashboard #index', as: '/admin'
#   resources :questions, controller: 'admin/dashboard_controller'
# end


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
