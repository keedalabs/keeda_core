# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                             reactions GET    /reactions(.:format)                                                                     reactions#index
#                                       POST   /reactions(.:format)                                                                     reactions#create
#                          new_reaction GET    /reactions/new(.:format)                                                                 reactions#new
#                         edit_reaction GET    /reactions/:id/edit(.:format)                                                            reactions#edit
#                              reaction GET    /reactions/:id(.:format)                                                                 reactions#show
#                                       PATCH  /reactions/:id(.:format)                                                                 reactions#update
#                                       PUT    /reactions/:id(.:format)                                                                 reactions#update
#                                       DELETE /reactions/:id(.:format)                                                                 reactions#destroy
#                                topics GET    /topics(.:format)                                                                        topics#index
#                                       POST   /topics(.:format)                                                                        topics#create
#                             new_topic GET    /topics/new(.:format)                                                                    topics#new
#                            edit_topic GET    /topics/:id/edit(.:format)                                                               topics#edit
#                                 topic GET    /topics/:id(.:format)                                                                    topics#show
#                                       PATCH  /topics/:id(.:format)                                                                    topics#update
#                                       PUT    /topics/:id(.:format)                                                                    topics#update
#                                       DELETE /topics/:id(.:format)                                                                    topics#destroy
#                            activities GET    /activities(.:format)                                                                    activities#index
#                                       POST   /activities(.:format)                                                                    activities#create
#                          new_activity GET    /activities/new(.:format)                                                                activities#new
#                         edit_activity GET    /activities/:id/edit(.:format)                                                           activities#edit
#                              activity GET    /activities/:id(.:format)                                                                activities#show
#                                       PATCH  /activities/:id(.:format)                                                                activities#update
#                                       PUT    /activities/:id(.:format)                                                                activities#update
#                                       DELETE /activities/:id(.:format)                                                                activities#destroy
#                           scan_images GET    /scan_images(.:format)                                                                   scan_images#index
#                                       POST   /scan_images(.:format)                                                                   scan_images#create
#                        new_scan_image GET    /scan_images/new(.:format)                                                               scan_images#new
#                       edit_scan_image GET    /scan_images/:id/edit(.:format)                                                          scan_images#edit
#                            scan_image GET    /scan_images/:id(.:format)                                                               scan_images#show
#                                       PATCH  /scan_images/:id(.:format)                                                               scan_images#update
#                                       PUT    /scan_images/:id(.:format)                                                               scan_images#update
#                                       DELETE /scan_images/:id(.:format)                                                               scan_images#destroy
#                             scenarios GET    /scenarios(.:format)                                                                     scenarios#index
#                                       POST   /scenarios(.:format)                                                                     scenarios#create
#                          new_scenario GET    /scenarios/new(.:format)                                                                 scenarios#new
#                         edit_scenario GET    /scenarios/:id/edit(.:format)                                                            scenarios#edit
#                              scenario GET    /scenarios/:id(.:format)                                                                 scenarios#show
#                                       PATCH  /scenarios/:id(.:format)                                                                 scenarios#update
#                                       PUT    /scenarios/:id(.:format)                                                                 scenarios#update
#                                       DELETE /scenarios/:id(.:format)                                                                 scenarios#destroy
#                        topic_activity GET    /topics/:id/activities/:activity_id(.:format)                                            topics#show
#                    new_topic_activity GET    /topics/:id/new_topic_activity(.:format)                                                 topics#new_topic_activity
#                      activity_replies GET    /activity_replies/:id(.:format)                                                          activities#activity_replies
#                                  root GET    /                                                                                        users#index
#                                blazer        /blazer                                                                                  Blazer::Engine
#                      new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#                          user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#                  destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#                     new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                                       PUT    /users/password(.:format)                                                                devise/passwords#update
#                                       POST   /users/password(.:format)                                                                devise/passwords#create
#              cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#                 new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#                edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#                     user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                                       PUT    /users(.:format)                                                                         devise/registrations#update
#                                       DELETE /users(.:format)                                                                         devise/registrations#destroy
#                                       POST   /users(.:format)                                                                         devise/registrations#create
#                       new_user_unlock GET    /users/unlock/new(.:format)                                                              devise/unlocks#new
#                           user_unlock GET    /users/unlock(.:format)                                                                  devise/unlocks#show
#                                       POST   /users/unlock(.:format)                                                                  devise/unlocks#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#
# Routes for Blazer::Engine:
#       run_queries POST   /queries/run(.:format)            blazer/queries#run
#    cancel_queries POST   /queries/cancel(.:format)         blazer/queries#cancel
#     refresh_query POST   /queries/:id/refresh(.:format)    blazer/queries#refresh
#    tables_queries GET    /queries/tables(.:format)         blazer/queries#tables
#    schema_queries GET    /queries/schema(.:format)         blazer/queries#schema
#      docs_queries GET    /queries/docs(.:format)           blazer/queries#docs
#           queries GET    /queries(.:format)                blazer/queries#index
#                   POST   /queries(.:format)                blazer/queries#create
#         new_query GET    /queries/new(.:format)            blazer/queries#new
#        edit_query GET    /queries/:id/edit(.:format)       blazer/queries#edit
#             query GET    /queries/:id(.:format)            blazer/queries#show
#                   PATCH  /queries/:id(.:format)            blazer/queries#update
#                   PUT    /queries/:id(.:format)            blazer/queries#update
#                   DELETE /queries/:id(.:format)            blazer/queries#destroy
#         run_check GET    /checks/:id/run(.:format)         blazer/checks#run
#            checks GET    /checks(.:format)                 blazer/checks#index
#                   POST   /checks(.:format)                 blazer/checks#create
#         new_check GET    /checks/new(.:format)             blazer/checks#new
#        edit_check GET    /checks/:id/edit(.:format)        blazer/checks#edit
#             check PATCH  /checks/:id(.:format)             blazer/checks#update
#                   PUT    /checks/:id(.:format)             blazer/checks#update
#                   DELETE /checks/:id(.:format)             blazer/checks#destroy
# refresh_dashboard POST   /dashboards/:id/refresh(.:format) blazer/dashboards#refresh
#        dashboards POST   /dashboards(.:format)             blazer/dashboards#create
#     new_dashboard GET    /dashboards/new(.:format)         blazer/dashboards#new
#    edit_dashboard GET    /dashboards/:id/edit(.:format)    blazer/dashboards#edit
#         dashboard GET    /dashboards/:id(.:format)         blazer/dashboards#show
#                   PATCH  /dashboards/:id(.:format)         blazer/dashboards#update
#                   PUT    /dashboards/:id(.:format)         blazer/dashboards#update
#                   DELETE /dashboards/:id(.:format)         blazer/dashboards#destroy
#              root GET    /                                 blazer/queries#home

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Attractor::Rails::Engine, at: "/attractor" if Rails.env.development?
  mount Coverband::Reporters::Web.new, at: '/coverage'
  get 'dashboard/index'
  resources :reactions
  resources :topics
  get 'activities/rollback'
  get 'activities/versions'
  resources :activities
  resources :scan_images
  resources :scenarios

  get 'topics/:id/activities/:activity_id', to: 'topics#show', as: 'topic_activity'
  get 'topics/:id/wiki/:book_id', to: 'book#index', as: 'book_index'
  get 'topics/:id/event/:event_id', to: 'event#index', as: 'event_index'
  get 'topics/:id/wiki/:book_id/chapter/:chapter_id', to: 'chapter#index', as: 'chapter_index'
  get 'topics/:id/wiki/:book_id/chapter/:chapter_id/page/:page_id', to: 'page#index', as: 'page_index'
  get 'topics/:id/wiki', to: 'topics#wiki_list', as: 'topic_wiki_list'
  get 'topics/:id/events', to: 'topics#event_list', as: 'topic_event_list'
  get 'topics/:id/new_topic_activity', to: 'topics#new_topic_activity', as: 'new_topic_activity'
  get 'activity_replies/:id', to: 'activities#activity_replies', as: 'activity_replies'
  root 'dashboard#index'
  mount Blazer::Engine, at: "blazer"
  # resources :users
  # devise_for :users, path_names: {
  #   sign_in: 'login', sign_out: 'logout',
  #   password: 'secret', confirmation: 'verification',
  #   registration: 'register', edit: 'edit/profile'
  # }
  # devise_for :users, ActiveAdmin::Devise.config
  devise_for :users
  get 'users/:id', to: 'users#show', as: 'user_path'
  #ActiveAdmin.routes(self)

  #  views: { sessions: "users/sessions", shared: "users/shared", confirmations: "users/confirmations",
  #                                   unlocks: "users/unlocks", mailer: "users/mailer", passwords: "users/passwords", 
  #                                   registrations: "users/registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
