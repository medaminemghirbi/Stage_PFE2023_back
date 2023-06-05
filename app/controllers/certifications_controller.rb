class CertificationsController < ApplicationController
  before_action :authorize_request, except: %i[get_user_certification]

    #** CRUD functionlity **#

    def index
        render json: Certification.all.order(id: :ASC)
    end
    def create
        @certification = Certification.new(post_params)
        if @certification.save

          render json: @certification, statut: :created, location: @certification
        else
          render json: @certification.errors, statut: :unprocessable_entity
        end
      end

      def show
        @certification = Certification.find(params[:id])
        render json: @certification
      end

      def update
        @certification = Certification.find(params[:id])
        if @certification.update(post_params2)
          render json: @certification

        else
          render json: @certification.errors, statut: :unprocessable_entity
        end
      end

      def destroy
        @certification = Certification.find(params[:id])
        @certification.destroy
      end

      #** custom functionlity **#

      def get_user_certification
        @certification = Certification.where(user_id: params[:user_id])
        render json: @certification
      end

      #** les fonctions private de classe ***#

      private

      def post_params
        params.permit(:certification_name, :etablissement, :date_certif, :user_id)
      end

      def post_params2
        params.permit(:certification_name, :etablissement, :date_certif)
      end

      def set_post
        @certification = Certification.find(params[:id])
      end
end
