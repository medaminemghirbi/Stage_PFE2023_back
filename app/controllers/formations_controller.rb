class FormationsController < ApplicationController
  before_action :authorize_request, except: %i[get_user_Formation]

    #************************* CRUD functionlity ****************************#

    def index
        render json: Formation.all.order(id: :ASC)
    end
    def create
        @formation = Formation.new(post_params)
        if @formation.save

          render json: @formation, statut: :created, location: @formation
        else
          render json: @formation.errors, statut: :unprocessable_entity
        end
      end

      def show
        @formation = Formation.find(params[:id])
        render json: @formation
      end

      def update
        @formation = Formation.find(params[:id])
        if @formation.update(post_params2)
          render json: @formation

        else
          render json: @formation.errors, statut: :unprocessable_entity
        end
      end

      def destroy
        @formation = Formation.find(params[:id])
        @formation.destroy
      end

      #************************* custom functionlity ***************************#


      def get_user_Formation
        @formation = Formation.where(user_id: params[:user_id])
        render json: @formation
      end

      #************************* les fonctions private de classe ***********************#

      private

      def post_params
        params.permit(:diplome, :description, :date_debut, :date_fin, :ecole, :niveau_etude, :user_id)
      end

      def post_params2
        params.permit(:diplome, :description, :date_debut, :date_fin, :ecole, :niveau_etude, :user_id)
      end

      def set_post
        @formation = Formation.find(params[:id])
      end
end
