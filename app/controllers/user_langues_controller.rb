class UserLanguesController < ApplicationController
    before_action :authorize_request, except: %i[get_user_langue]

    #************************* CRUD functionlity ***************************#
    def create
        @UserLangue = UserLangue.new(post_params)

        if @UserLangue.save

            render json: @UserLangue, statut: :created, location: @UserLangue
        else
          render json: @UserLangue.errors, statut: :unprocessable_entity
        end
    end
    def update
        @UserLangue = UserLangue.find(params[:id])
        if @UserLangue.update(post_params)
            render json: @UserLangue

        else
            render json: @langue.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @UserLangue = UserLangue.find(params[:id])
        @UserLangue.destroy
    end
    #************************* custom functionlity ***************************#
    def get_user_langue
        @userlangue = UserLangue.where(user_id: params[:user_id])
        render json: @userlangue, include: [:user, :langue]
    end

    #************************* les fonctions private de classe ***********************#

    private
    def post_params
        params.permit(:niveau, :user_id, :langue_id)
    end

end

