class UsersController < Devise::SessionsController

  def new
    redirect_to root_path
  end
end
