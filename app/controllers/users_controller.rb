class UsersController < Devise::SessionsController

  def new
    redirect_to root_path
  end

  def edit
  end

  def update
    @is_updated = current_user.update(user_params)
    render :edit
  end

  def history
    @ordering_records, @borrowing_records, @returned_records = current_user.action_history
  end

  private
  def user_params
    params.require(:user).permit(:name, :team, :building, :office, :seat)
  end
end
