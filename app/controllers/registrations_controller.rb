class RegistrationsController < ApplicationController
  before_action :authorize_request, except: %i[create confirm_email]

    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.email_confirmed = true
            user.confirm_token = nil
            user.save
            redirect_to 'http://localhost:4200/login'
        else
            render json: { status: 500 }

        end

    end


      def create
        user = User.create!(
          lastname: params['lastname'],
          firstname: params['firstname'],
          email: params['email'],
          password: params['password'],
          password_confirmation: params['password_confirmation'],
          role: params['role'].to_i
        )
        if user
          UserMailer.registration_confirmation(user).deliver
          session[:user_id] = user.id
          render json: {
            status: :created,
            user: user
          }

        end
      end
    end

