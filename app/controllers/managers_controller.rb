class ManagersController < ApplicationController

    get '/signup' do
        erb :"/manager/new"
    end
    
    post '/signup' do

        manager = Author.new(params["manager"])
    
        if manager.save
          session[:manager_id] = manager.id
          redirect to "/manager"
        
        else
          @errors = manager.errors.full_messages
          erb :"/manager/new"
        end
      end

      get '/manager/:id' do
        # binding.pry
        @manager = Manager.find_by_id(params[:id])
        erb :"/manager/show"
      end
        
end
