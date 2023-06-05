class CategoriesController < ApplicationController
  before_action :authorize_request
    #************************* CRUD functionlity ****************************#
    def index
        render json: Categorie.all.order(id: :ASC), include: [  :domain  ]
    end
    def create
        @categorie = Categorie.new(post_params)
        if @categorie.save

          render json: @categorie, statut: :created, location: @categorie
        else
          render json: @categorie.errors, statut: :unprocessable_entity
        end
      end

      def show
        @categorie = Categorie.find(params[:id])
        render json: @categorie
      end

      def update
        @categorie = Categorie.find(params[:id])
        if @categorie.update(post_params2)
          render json: @categorie

        else
          render json: @categorie.errors, statut: :unprocessable_entity
        end
      end

      def destroy
        @categorie = Categorie.find(params[:id])
        @categorie.destroy
      end

    #************************* les fonctions private de classe *************#
      def get_categorie_by_domain
        @categorie = Categorie.where(domain_id: params[:domain_id])
        render json: @categorie
      end

      private

      def post_params
        params.permit(:categorie_name, :domain_id)
      end

      def post_params2
        params.permit(:categorie_name, :domain_id)
      end

      def set_post
        @categorie = Categorie.find(params[:id])
      end
end