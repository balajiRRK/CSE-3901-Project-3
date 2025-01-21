class UsersController < ApplicationController
  before_action :authenticate_admin!

  def user_actions
    @user = User.find(params[:id])
  end
  def update
  
    respond_to do |format|
      @user = User.find(params[:id])
      if @user.update(user_params)
        format.html { redirect_to admin_dashboard_path, notice: "user was successfully updated." }
        # format.json { render :show, status: :ok, location: @user }
      else
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # To avoid conflicts with devise
  def destroy
    @user = User.find(params[:id])
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to admin_dashboard_path, alert: "user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @api_search = ApiSearch.find(params[:id])
  end

  
  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :encrypted_password, :reset_password_token, :role, :status )
  end
end
