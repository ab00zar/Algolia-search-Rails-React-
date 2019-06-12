class WelcomeController < ActionController::Base
    
    before_action :force_json, only: :search

    def index 
    end

    def search
        @movies =  Movie.search(params[:q])
    end

    private
    def force_json
        request.format = :json
    end
end