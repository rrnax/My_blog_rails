class Admin::AdminController < ApplicationController
  before_action :my_authenticate_user!

  def my_authenticate_user!
    authenticate_user! if current_user.admin
  end

end
