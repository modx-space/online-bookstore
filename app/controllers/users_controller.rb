class UsersController < Devise::SessionsController

  def new
    redirect_to root_path
  end

  def history
    @ordering_records, @borrowing_records, @returned_records = current_user.action_history
  end
end
