Rails.application.routes.draw do


  root to: 'first#index'
  namespace :ps1 do
    get 'divide_by_zero/page'
    # get "divide_by_zero/page", to: "divide_by_zero#page", as: "divide_by_zero"
    get 'googlenews/news'
  end
  get 'first/ps'
  get 'first/index'
  get 'first/stocks_i_like'
  get 'quote_dbs/index'
  post '/import' => 'quote_dbs#import', :as => 'import'
  get 'first/transcript'
  get 'first/log'
  get 'first/input'
  get 'first/code'
  get 'quote_dbs/export', as: 'export'
  get 'quote_dbs/export_xml', as: 'export_xml'
  root 'quote_dbs#index'
  get '/search' => 'quote_dbs#search', :as => 'search_page'
  get '/quote_dbs/:id/kill(.:format)' => 'quote_dbs#kill', :as => 'killed'
  get '/quote_dbs/:id/del(.:format)' => 'quote_dbs#del', :as => 'deleted'
  resources :quote_dbs
  # resources :ps1s
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
