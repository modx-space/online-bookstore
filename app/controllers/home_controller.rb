class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    redirect_to guide_books_path if user_signed_in?
    @user = User.new
  end
end
