class SessionsController < ApplicationController
  

    get '/login' do
        erb :"/sessions/new"
    end

    post '/login' do
        manager = Manager.find_by(email: params[:manager][:email])
        # binding.pry
        if manager && manager.authenticate(params[:manager][:password])
            session[:manager_id] = manager.id
            redirect to "/manager/#{manager.id}"

        else
            redirect to "/login"
        end
    end

    post '/logout' do
        session.clear
        redirect to '/'
    end
end
