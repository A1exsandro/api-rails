module Api::V1
  class ApiController < ApplicationController
    acts_as_token_authentication_handler_for User
    before_action :require_authetication!
    
    private
      def require_authetication!
        throw(:warden, scope: :user) unless current_user.presence
      end
  end
end
