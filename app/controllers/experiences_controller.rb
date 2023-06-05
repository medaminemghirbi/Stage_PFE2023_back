class ExperiencesController < ApplicationController
    before_action :authorize_request, except: %i[get_user_experience]
    #************************* CRUD functionlity ****************************#

    def index
        render json: Experience.all.order(id: :ASC)
    end
    def create
        @experience = Experience.new(post_params)
        if @experience.save

            render json: @experience, statut: :created, location: @experience
        else
          render json: @experience.errors, statut: :unprocessable_entity
        end
    end

    def show
        @experience = Experience.find(params[:id])
        render json: @experience
    end

    def update
        @experience = Experience.find(params[:id])
        if @experience.update(post_params2)
            render json: @experience

        else
            render json: @experience.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @experience = Experience.find(params[:id])
        @experience.destroy
    end

    #************************* custom functionlity ***************************#

    def get_user_experience
        @experience = Experience.where(user_id: params[:user_id])
        render json: @experience
    end

    #************************* les fonctions private de classe ***********************#

    private

        def post_params
           params.permit(:entreprise, :position_held, :start_date, :end_date, :user_id)
        end

        def post_params2
            params.permit(:entreprise, :position_held, :start_date, :end_date, :user_id)
        end

        def set_post
           @experience = Experience.find(params[:id])
        end


end
