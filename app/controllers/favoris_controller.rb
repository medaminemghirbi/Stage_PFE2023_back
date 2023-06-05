class FavorisController < ApplicationController
    before_action :authorize_request

    #************************* CRUD functionlity ****************************#

    def index
        render json: Favori.all.order(id: :ASC)
    end
    def create
        @favori = Favori.new(post_paramsfavori)
        if @favori.save

            render json: @favori, statut: :created, location: @favori
        else
          render json: @favori.errors, statut: :unprocessable_entity
        end
    end


    def show
        @favori = Favori.where(user_id: params[:user_id])
        render json: @favori , include: [:user, :offre]
    end

    def update
        @favori = Favori.find(params[:id])
        if @favori.update(post_paramsfavori2)
            render json: @favori

        else
            render json: @langue.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @favori = Favori.find(params[:id])
        @favori.destroy
    end

    #************************* les fonctions private de classe ***********************#

    private

    def post_paramsfavori
        params.permit(:user_id, :offre_id)
    end
    def post_paramsfavori2
        params.permit(:user_id, :offre_id)
    end
    def set_post
        @favori = Favori.find(params[:id])
     end

end
