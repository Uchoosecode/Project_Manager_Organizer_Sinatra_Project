class ManagersController < ApplicationController

    get '/managers' do
        @managers = Manager.all

        erb :"/managers/index"
    end
end
