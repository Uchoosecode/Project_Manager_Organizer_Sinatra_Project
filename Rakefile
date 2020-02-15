ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "starts a pry console"
    task :console do
        Pry.start
    end
    
    desc "total reset"
        task "total_reset" do
            system("rm db/development.sqlite")
            system("rm db/schema.rb")
            system("rake db:migrate")
            system("rake db:seed")
        end
