class ApplicationController < ActionController::Base
  protected

  def current_user
  	Student.first
  end
end
