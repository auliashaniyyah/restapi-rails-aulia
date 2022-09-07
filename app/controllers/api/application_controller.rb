module Api
    class ApplicationController < ActionController::API
    before_action :doorkeeper_authorize!
     include Response
  
      private
      # def current_user
      #   return if doorkeeper_token.nil?
  
      #   if doorkeeper_token.resource_owner_id.present?
      #     User.find(doorkeeper_token.resource_owner_id)
      #   else
      #     'client_credentials'
      #   end
      # end
  
      # helper method to access the current user from the token
    end
  end