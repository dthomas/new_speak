Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :dashboards, only: :index

  resources :courses, shallow: true do
    resources :academic_terms do
      resources :course_subjects do
        resources :teaching_assignments do
          resources :assessments do
            resources :tasks do
              member do
                get 'marks'
                patch 'marks_update'
              end
            end
            get 'grade', on: :member
          end
        end
      end
    end

    resources :course_sessions do
      resources :class_groups
    end
  end

  resources :admissions, only: [:index, :new, :create]
  resources :students, except: [:new, :create]

  resources :teachers

  class NewSpeakMain
    def self.matches?(request)
      request.host.match /\A(www.|)newspeak.com\z/i
    end
  end

  constraints NewSpeakMain do
    resources :accounts, only: [:new, :create]
  end
  # resources :institutes, only: :create

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
