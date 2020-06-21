class AdminController < ApplicationController
  before_action :admin?

  def admin?
    render file: 'public/500.html' unless params[:admin]
  end
      
  def users_count
    @users_count = User.count
  end
end
