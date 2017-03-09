class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to current_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location:current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    post = @user.posts
  end
  def user_params
    params.require(:user).permit(:name, :email )
  end
  def edit
    @user = current_user
  end
end
