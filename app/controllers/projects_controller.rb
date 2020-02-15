class ProjectsController < ApplicationController
    
   
    
    get '/projects' do
        
        @projects = Project.all
        erb :"/projects/index"
    end
end