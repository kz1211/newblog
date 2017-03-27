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

  def edit_password
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.update_with_password(password_params)
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit_password"
    end
  end

  def edit
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email )
  end

  def password_params
    params.require(:user).permit(:password, :current_password )
  end


end
