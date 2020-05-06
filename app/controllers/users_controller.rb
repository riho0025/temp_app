class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @records = @user.records
    @users = User.all
    @graph_records = @user.records.pluck(:value)
    @graph_date = @user.records.pluck(:date).map{|date| date.strftime("%m/%d")}
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
