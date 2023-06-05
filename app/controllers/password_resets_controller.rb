class PasswordResetsController < ApplicationController

    #************************* CRUD functionlity ****************************#
    def create
      user = User.find_by_email(params[:email])
      if user
        user.send_password_reset
        # Add the code for sending the password reset email
      else
        render json: { error: 'User not found' }, status: :unauthorized
      end
    end
    def edit
        @user = User.find_by_password_reset_token!(params[:id])
    end
    def update
        @user = User.find_by_password_reset_token!(params[:id])
        if @user.update(user_params)
          render json: "password link has been updated"
        else
          redirect_to 'http://localhost:4200/login'
        end
      end

    #************************* les fonctions private de classe ***********************#

      private
      def user_params
        params.permit(:password)
    end
end
