class CompetencesController < ApplicationController
    before_action :authorize_request, except: %i[get_user_competence]
    #************************* CRUD functionlity ***************************#
    def create
        @Competence = Competence.new(post_params)
        if @Competence.save

            render json: @Competence, statut: :created, location: @Competence
        else
          render json: @Competence.errors, statut: :unprocessable_entity
        end
    end
    def update
        @Competence = Competence.find(params[:id])
        if @Competence.update(post_params)
            render json: @Competence

        else
            render json: @Competence.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @Competence = Competence.find(params[:id])
        @Competence.destroy
    end
    #************************* custom functionlity ***************************#
    def get_user_competence
        @Competence = Competence.where(user_id: params[:user_id])
        render json: @Competence, include: [:user, :souscategorie]
    end

    #************************* les fonctions private de classe ***********************#

    private
    def post_params
        params.permit(:niveau, :user_id, :souscategorie_id)
    end

end

