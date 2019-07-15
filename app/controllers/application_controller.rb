class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  serialization_scope :view_context

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  def set_user_when_token
    if request.headers['Authorization']
      @current_user = (AuthorizeApiRequest.new(request.headers).get_user)[:user]
      headers['USER_ID'] = @current_user.id
    end
  end
end
