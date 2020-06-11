Rails.application.routes.draw do

  get("/", { :controller => "pages", :action => "puzzle" })
  post("/record_guess", { :controller => "pages", :action => "write_cookie" })

  post("/record_rule", { :controller => "pages", :action => "write_rule"})

  
  # ======== Add your routes above this =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
