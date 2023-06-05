class LanguesController < ApplicationController
    before_action :authorize_request

    #************************* CRUD functionlity ****************************#

    def index
        render json: Langue.all.order(id: :ASC)
    end
    def create
        @langue = Langue.new(post_params)
        if @langue.save

            render json: @langue, statut: :created, location: @langue
        else
          render json: @langue.errors, statut: :unprocessable_entity
        end
    end

    def show
        @langue = Langue.find(params[:id])
        render json: @langue
    end

    def update
        @langue = Langue.find(params[:id])
        if @langue.update(post_params2)
            render json: @langue

        else
            render json: @langue.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @langue = Langue.find(params[:id])
        @langue.destroy
    end

    #************************* les fonctions private de classe ***********************#

    private

        def post_params
           params.permit(:langue_name)
        end

        def post_params2
           params.permit(:langue_name)
        end

        def set_post
           @langue = Langue.find(params[:id])
        end

end

