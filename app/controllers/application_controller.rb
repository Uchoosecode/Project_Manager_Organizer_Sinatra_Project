require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["TOKEN"]{SecureRandom.hex(64)}
  end

  get "/" do
    @session = session
    erb :welcome
  end

  def logged_in?
    !!current_manager
  end
  
  def current_manager
    @the_manager ||= Manager.find_by(id: session[:manager_id])
    # variable to helps the authenticate without having to go to the db every request.

  end
  
  def redirect_not_logged_in
    if !logged_in?
      redirect '/'
    end
  end
end
    