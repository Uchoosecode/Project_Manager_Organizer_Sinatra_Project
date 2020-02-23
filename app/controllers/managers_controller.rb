class ManagersController < ApplicationController

  get '/signup' do
    erb :"/manager/new"
  end
    
  post '/signup' do

    manager = Manager.new(params["managers"])
        
    if manager.save
      session[:manager_id] = manager.id
      redirect to "/manager/#{manager.id}"
        
    else
      @errors = managers.errors.full_messages
      erb :"/manager/new"
    end
  end

  get '/manager/:id' do
        
    @manager = Manager.find_by(params[:id])
    erb :"/manager/show"
  end
       
  post '/manager/' do
    erb  :"/projects"
  end

  get '/manager/:id/edit' do
    @manager = Manager.find_by_id(params[:id])
       
    erb :"/edit"
  end
        
  patch '/manager/:id' do
    @manager = Manager.find_by_id(params[:id])
        
    if @manager.update(params[:managers])
        redirect to "/manager"
            
    else
        erb :"manager/edit"
    end
  end

  delete "/manager" do
    @manager = current_manager
    
    if @manager 
        @manager.destroy
    end
    
    redirect to "/"
    
  end
end