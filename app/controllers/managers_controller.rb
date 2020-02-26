class ManagersController < ApplicationController

  get '/signup' do
    erb :"/managers/new"
  end
    
  post '/signup' do

    manager = Manager.new(params["managers"])
        
    if manager.save
      session[:manager_id] = manager.id
      redirect to "/managers/#{manager.id}"
        
    else
      @errors = manager.errors.full_messages
      erb :"/managers/new"
    end
  end

  get '/managers/:id' do
        
    @manager = Manager.find_by(params[:id])
    erb :"/managers/show"
  end
       
  post '/managers/' do
    erb  :"/projects"
  end

  get '/managers/:id/edit' do
    @manager = Manager.find_by_id(params[:id])
       
    erb :"/managers/edit"
  end
 
  patch '/managers/:id' do
    @manager = Manager.find_by_id(params[:id])
        
    if @manager.update(params[:manager])
        redirect to "/managers/#{current_manager.id}"
            
    else
        erb :"managers/edit"
    end
  end

  delete "/managers" do
    @manager = current_manager
    
    if @manager 
        @manager.destroy
    end
    
    redirect to "/"
    
  end
end