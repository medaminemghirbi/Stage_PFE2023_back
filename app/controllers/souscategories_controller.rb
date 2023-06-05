class SouscategoriesController < ApplicationController
  before_action :authorize_request

    #************************* CRUD functionlity ****************************#
  #fix all user
    def index
    render json: Souscategorie.includes(categorie: [:domain]).order(id: :ASC), include: [categorie: { only: [:id, :categorie_name], include: { domain: { only: [:id, :domain_name] } } }]    end
    def create
        @souscategorie = Souscategorie.new(post_params)
        if @souscategorie.save

          render json: @souscategorie, statut: :created, location: @souscategorie
        else
          render json: @souscategorie.errors, statut: :unprocessable_entity
        end
      end

      def show
        @souscategorie = Souscategorie.find(params[:id])
        render json: @souscategorie
      end

      def update
        @souscategorie = Souscategorie.find(params[:id])
        if @souscategorie.update(post_params2)
          render json: @souscategorie

        else
          render json: @souscategorie.errors, statut: :unprocessable_entity
        end
      end

      def destroy
        @souscategorie = Souscategorie.find(params[:id])
        @souscategorie.destroy
      end

    #************************* custom  functionlity***********************#
      def get_sous_categorie_by_categorie
        @souscategorie = Souscategorie.where(categorie_id: params[:categorie_id])
        render json: @souscategorie
      end
    #************************* les fonctions private de classe ***********************#

      private

      def post_params
        params.permit(:sous_categorie_name, :categorie_id)
      end

      def post_params2
        params.permit(:sous_categorie_name, :categorie_id)
      end

      def set_post
        @souscategorie = Souscategorie.find(params[:id])
      end
end