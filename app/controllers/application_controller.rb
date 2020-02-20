require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enable :sessions
    # set :session_secret "0i1f2s3e4c5r6e7t8w9a0s1a2s3e4s5s6i7o8n9"
  end

  get "/" do
    @session = session
    erb :welcome
  end

    
    def logged_in?
      !!current_manager
    end
    
    def current_manager
      Manager.find_by(id: session[:manager_id])
    end
    
end