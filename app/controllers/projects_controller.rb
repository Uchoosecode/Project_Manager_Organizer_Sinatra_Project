class ProjectsController < ApplicationController
    
    before  do
        redirect_not_logged_in
    end
    
    get '/projects' do
        
        @projects = current_manager.projects
        erb :"/projects/index"
    end
    
    patch '/projects' do
        @projects = Project.find_by_id(params[:id])
        
        # binding.pry
        if @projects.update(params[:project])
          redirect to "/projects"
        
        else @errors = project.errors.full_messages
          erb :"/projects/edit"
        end
    end

    get '/projects/new' do
        erb :"/projects/new"
      end
      
    post '/projects/new' do
        
        project = Project.new(params["projects"])
        
        if project.save
            redirect to "/projects"
        
        else @errors = project.errors.full_messages
            erb :"/projects/new"
        end
    end

    get '/projects/:id' do
        
        @projects = Project.find_by_id(params[:id])
        erb :"/projects/show"
    end
        
    get '/projects/:id/edit' do
        @projects = Project.find_by_id(params[:id])
        
        erb :"projects/edit"
    end
    
    patch '/projects/:id' do
        @projects = Project.find_by_id(params[:id])
        if @projects.update(params[:projects])
            
            redirect to "/projects"
            
        else @errors = project.errors.full_messages
            erb :"projects/edit"
        end
    end
    
    delete '/projects/:id' do
        @projects = Project.find_by_id(params[:id])

        if @projects
            @projects.destroy
        end
        
        redirect to "/projects"
        
    end
        

end