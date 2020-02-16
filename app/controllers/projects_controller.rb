class ProjectsController < ApplicationController
    
   
    
    get '/projects' do
        
        @projects = Project.all
        erb :"/projects/index"
    end

    get '/projects/new' do
        "Hello World"
      end
      
end