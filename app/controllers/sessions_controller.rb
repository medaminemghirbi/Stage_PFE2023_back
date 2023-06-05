class SessionsController < ApplicationController
include CurrentUserConcern
    def create
        @user = User
            .find_by(email: params['user']['email'])
            .try(:authenticate, params['user']['password'])
        if @user
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            Rails.cache.write("blacklist/#{token}", true, expires_in: time.to_i - Time.now.to_i)
            render json: {
                logged_in: true,
                user: @user,
                role: @user.role,
                token: token,
                exp: time.strftime("%m-%d-%Y %H:%M")
            }, methods: [:user_image_url]
        else
            render json: { status: 401 }
        end
    end
    def logged_in
        if @current_user
            render json: {
                logged_in: true,
                user: @current_user
            }
        else
            render json: {
                logged_in: false
            }
        end
    end
    def logout
        token = request.headers['Authorization']&.split(' ')&.last
        if token.present?
          # Remove the token from the blacklist cache
          Rails.cache.delete("blacklist/#{token}")
        end

        reset_session
        render json: { status: 200, logged_out: true }
      end
end