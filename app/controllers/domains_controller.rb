class DomainsController < ApplicationController
  before_action :authorize_request, except: %i[index]

    #************************* CRUD functionlity ****************************#

    def  index
        render json: Domain.all.order(id: :ASC), methods: [:formatted_created_at, :formatted_updated_at]
    end
    def create
        @domain = Domain.new(post_params)
        if @domain.save

          render json: @domain, statut: :created, location: @domain
        else
          render json: @domain.errors, statut: :unprocessable_entity
        end
      end

      def show
        @domain = Domain.find(params[:id])
        render json: @domain
      end

      def update
        @domain = Domain.find(params[:id])
        if @domain.update(post_params2)
          render json: @domain

        else
          render json: @domain.errors, statut: :unprocessable_entity
        end
      end

      def destroy
        @domain = Domain.find(params[:id])
        @domain.destroy
      end

      #************************* les fonctions private de classe ***********************#

      private

      def post_params
        params.permit(:domain_name)
      end

      def post_params2
        params.permit(:domain_name)
      end

      def set_post
        @domain = Domain.find(params[:id])
      end
end