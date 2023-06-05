class OffresController < ApplicationController
    before_action :authorize_request, except: %i[missiondata index]

    #************************* Custom functionlity ****************************#

      #********** All offre(JOB + Internship + Freelance) [Admin]**********#
      def get_Freelance_offre_by_Admin
        @offre = Offre.where(type_offre: "Freelance").where(user_id: params[:user_id])
        render json: @offre
      end
      def get_Emploi_offre_by_Admin
        @offre = Offre.where(type_offre: "Emploi").where(user_id: params[:user_id])
        render json: @offre
      end
      def get_Stage_offre_by_Admin
        @offre = Offre.where(type_offre: "Stage").where(user_id: params[:user_id])
        render json: @offre
      end
      #********** All offre( Internship) [Intern]**********#
      def get_Stage_offre_by_Intern
        @offre = Offre.includes(:user)
        .where(type_offre: "Stage")
        .includes(offre_categories: { souscategorie: { categorie: :domain } })
        render json: @offre, include: { user: { methods: [:user_image_url] },
         offre_categories: { include: { souscategorie: { include: { categorie: { include: :domain } } } } } }
      end
      #********** All offre( JOB) [Jobseeker]**********#

      def get_Emploi_offre_by_Jobseeker
        @offre = Offre.includes(:user)
        .where(type_offre: "Emploi")
        .includes(offre_categories: { souscategorie: { categorie: :domain } })
        render json: @offre, include: { user: { methods: [:user_image_url] },
         offre_categories: { include: { souscategorie: { include: { categorie: { include: :domain } } } } } }
      end
      #********** All offre( FREELANCE) [Freelancer]**********#

      def get_Freelance_offre_by_Frelancer
        @offre = Offre.includes(:user)
        .where(type_offre: "Freelance")
        .includes(offre_categories: { souscategorie: { categorie: :domain } })
        render json: @offre, include: { user: { methods: [:user_image_url] },
         offre_categories: { include: { souscategorie: { include: { categorie: { include: :domain } } } } } }
      end


 #**********Active Offre(JOB + Internship + Freelance) [Admin]**********#

    def get_Active_Freelance_offre_by_Admin
      @offre = Offre.where(type_offre: "Freelance").where(user_id: params[:user_id]).where(is_completed: "false")
      @candidature = Candidature.where(offre_id: @offre.ids  ).where(etat: "Accepted")
      render json: @candidature, include: [  :offre , :user ]
    end

    def get_Active_Job_offre_by_Admin
      @offre = Offre.where(type_offre: "Emploi").where(user_id: params[:user_id])
      @candidature = Candidature.where(offre_id: @offre.ids  ).where(etat: "Accepted")
      render json: @candidature, include: [  :offre , :user ]
    end

    def get_Active_Internship_offre_by_Admin
      @offre = Offre.where(type_offre: "Stage").where(user_id: params[:user_id])
      @candidature = Candidature.where(offre_id: @offre.ids  ).where(etat: "Accepted")
      render json: @candidature, include: [  :offre , :user ]
    end

 #**********Ended Offre(JOB + Internship + Freelance) [Admin]**********#

    def get_Ended_Freelance_offre_by_Admin
      @offre = Offre.where(type_offre: "Freelance").where(is_completed: "true").where(user_id: params[:user_id])
      @candidature = Candidature.where(offre_id: @offre.ids  ).where(etat: "Accepted")
      render json: @candidature, include: [  :offre , :user ]
    end

    def get_Ended_Internship_offre_by_Admin
      @offre = Offre.where(type_offre: "Stage").where(" Date.today.to_s > end_date").where(user_id: params[:user_id])
      @candidature = Candidature.where(offre_id: @offre.ids  ).where(etat: "Accepted").where(user_id: params[:user_id])
      render json: @candidature, include: [  :offre , :user ]
    end




      #**********  offre details(JOB + Internship + Freelance) **********#
      def missiondata
        @offre = Offre.includes(:user)
        .where(id: params[:id])
        .includes(offre_categories: { souscategorie: { categorie: :domain } })
        render json: @offre, include: { user: { methods: [:user_image_url] },
         offre_categories: { include: { souscategorie: { include: { categorie: { include: :domain } } } } } }
      end



    #************************* CRUD functionlity ****************************#

    def  index
      @offre = Offre.includes(:user)
      .includes(offre_categories: { souscategorie: { categorie: :domain } })
      render json: @offre, include: { user: { methods: [:user_image_url] },
       offre_categories: { include: { souscategorie: { include: { categorie: { include: :domain } } } } } }
    end
     #**********Create Offre(JOB + Internship + Freelance) [Admin]**********#
    def create
      @offre = Offre.new(post_params)
      if params[:start_date].present? && params[:end_date].present?
        start_date = Date.parse(params[:start_date])
        end_date = Date.parse(params[:end_date])
        duration = months_between(start_date, end_date)
        @offre.duration = duration
      end
      if @offre.save
        souscategorie_ids = params[:souscategorie_id].split(',')
        souscategorie_ids.each do |souscategorie_id|
          OffreCategorie.create!(souscategorie_id: souscategorie_id.to_s, offre_id: @offre.id)
        end
        @souscategories = Souscategorie.where(id: souscategorie_ids)
        render json: {
          offre: @offre,
          souscategories: @souscategories
        }, status: :created, location: @offre
      else
        render json: @offre.errors, status: :unprocessable_entity
      end
    end


      def show
        @offre = Offre.find(params[:id])
        render json: @offre
      end

      def update
        @offre = Offre.find(params[:id])
        if @offre.update(post_params2)
          render json: @offre

        else
          render json: @offre.errors, statut: :unprocessable_entity
        end
      end

      def destroy
        @offre = Offre.find(params[:id])
        @offre.destroy
      end

    #************************* les fonctions private de classe ***********************#

      private

      def post_params
        params.permit(:titre_offre, :description, :niveau_etude, :type_contrat, :type_offre, :start_date, :duration, :end_date, :salaire, :is_payed, :is_completed, :filepath, :location, :experience, :user_id, offre_categories: [:souscategorie_id]  )
      end

      def post_params2
        params.permit(:titre_offre, :description, :niveau_etude, :type_contrat, :type_offre, :start_date, :end_date, :duration, :salaire, :is_payed, :is_completed, :filepath, :location, :experience, :user_id, offre_categories: [:souscategorie_id]  )
      end

      def set_post
        @offre = Offre.find(params[:id])
      end

      def months_between(start_date, end_date)
        months = (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)
        return months
    end
end
