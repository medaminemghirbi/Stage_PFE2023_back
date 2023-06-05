class CandidaturesController < ApplicationController
    before_action :authorize_request

    #************************* CRUD functionlity ****************************#
    def index
        render json: Candidature.all.order(id: :ASC)
    end
    def create
        @candidature = Candidature.new(post_params)
        if @candidature.save

            render json: @candidature, statut: :created, location: @candidature
        else
          render json: @candidature.errors, statut: :unprocessable_entity
        end
    end

    def update
        @candidature = Candidature.find(params[:id])
        if @candidature.update(post_params2)
            render json: @candidature

        else
            render json: @langue.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @candidature = Candidature.find(params[:id])
        @candidature.destroy
    end
 #************************* custom functionlity ***************************#
    def get_candidature_by_User
        @candidature = Candidature.where(user_id: params[:user_id])
        render json: @candidature , include: {
            offre: {},
            user: { methods: [:user_image_url] }
          }, methods: [:formatted_created_at, :formatted_created_at2]
    end

    def get_freelance_candidature_by_Admin
        ids = []
        @offre = Offre.where(type_offre: "Freelance").where(user_id: params[:user_id])
        @candidature = Candidature.where(offre_id: @offre.ids )
        render json: @candidature, include: {
            offre: {},
            user: { methods: [:user_image_url] }
          }, methods: [:formatted_created_at, :formatted_created_at2]
    end
    def get_emploi_candidature_by_Admin
        ids = []
        @offre = Offre.where(type_offre: "Emploi").where(user_id: params[:user_id])
        @candidature = Candidature.where(offre_id: @offre.ids )
        render json: @candidature, include: {
            offre: {},
            user: { methods: [:user_image_url] }
          }, methods: [:formatted_created_at, :formatted_created_at2]
        end
        def get_stage_candidature_by_Admin
        ids = []
        @offre = Offre.where(type_offre: "Stage").where(user_id: params[:user_id])
        @candidature = Candidature.where(offre_id: @offre.ids )
        render json: @candidature, include: {
            offre: {},
            user: { methods: [:user_image_url] }
          }, methods: [:formatted_created_at, :formatted_created_at2]
        end






    #************************* les condidatures etat = interview *************#
    def get_freelance_Interview_by_Admin
        ids = []
        @offre = Offre.where(type_offre: "Freelance").where(user_id: params[:user_id])
        @candidature = Candidature.where(offre_id: @offre.ids ).where(etat: "Interview")
        render json: @candidature, include: {
            offre: {},
            user: { methods: [:user_image_url] }
          }, methods: [:formatted_created_at, :formatted_created_at2]
    end
    def get_emploi_Interview_by_Admin
        ids = []
        @offre = Offre.where(type_offre: "Emploi").where(user_id: params[:user_id])
        @candidature = Candidature.where(offre_id: @offre.ids ).where(etat: "Interview")
        render json: @candidature, include: {
            offre: {},
            user: { methods: [:user_image_url] }
          }, methods: [:formatted_created_at, :formatted_created_at2]
        end
        def get_stage_Interview_by_Admin
        ids = []
        @offre = Offre.where(type_offre: "Stage").where(user_id: params[:user_id])
        @candidature = Candidature.where(offre_id: @offre.ids ).where(etat: "Interview")
        render json: @candidature, include: {
            offre: {},
            user: { methods: [:user_image_url] }
          }, methods: [:formatted_created_at, :formatted_created_at2]
        end


 #************************* les fonctions private de classe *************#



    def get_candidature_by_Offre
        @candidature = Candidature.where(offre_id: @offre.id).count
        render json: {
            condidature: @candidature
        }, methods: [:formatted_created_at, :formatted_created_at2]
    end

    #************************* les fonctions private de classe *************#
    private

    def post_params
        params.permit(:date_postulation, :etat, :user_id, :offre_id, :interview_date)
    end
    def post_params2
        params.permit(:date_postulation, :etat, :user_id, :offre_id, :interview_date)
    end
    def set_post
        @candidature = Candidature.find(params[:id])
     end

end
