class UsersController < ApplicationController
    before_action :authorize_request, except: %i[show get_admin_users]
    #************************* custom functionlity ***************************#
    def update_image_user
      @user = User.find(params[:id])
      if @user.update(paramsimageuser)
        render json: @user, methods: [:user_image_url]
      else
        render json: @user.errors, statut: :unprocessable_entity
      end
    end
    def paramsimageuser
      params.permit(:id, :avatar)
    end

    def get_admin_users
      @users = User.where(role: "admin").includes(:offres)

      @users = @users.map do |user|
        {
          user: user,
          offres_count: user.offres.count
        }
      end

      render json: {
        users: @users,
        meta: { count: @users.size }
      }
    end

    def count_all_for_admin
      @alloffres = Offre.where(user_id: params[:user_id]).count
      @freelanceoffres = Offre.where(user_id: params[:user_id]).where(type_offre: "Freelance").count
      @stageoffres= Offre.where(user_id: params[:user_id]).where(type_offre: "Stage").count
      @emploioffres= Offre.where(user_id: params[:user_id]).where(type_offre: "Emploi").count
      render json: {
        allmissions: @alloffres,
        freelanceoffres: @freelanceoffres,
        stageoffres: @stageoffres,
        emploioffres: @emploioffres
      }
    end
    #************************* CRUD functionlity ****************************#
    def  index

        render json: User.all.select { |m| m.role != 'superadmin'  }
    end
    def create
        @User = User.new(post_params)
        if @User.save

          render json: @User, statut: :created, location: @User
        else
          render json: @User.errors, statut: :unprocessable_entity
        end
      end

      def show
        @User = User.find(params[:id])
        render json: @User, methods: [:user_image_url]
      end

      def update
        @User = User.find(params[:id])
        if @User.update(post_params2)
          render json: @User, methods: [:user_image_url]

        else
          render json: @User.errors, statut: :unprocessable_entity
        end
      end

      def destroy
        @User = User.find(params[:id])
        @User.destroy
      end
    #************************* les fonctions private de classe ***********************#
      private

      def post_params2
        params.permit(:email, :password_confirmation, :password, :lastname, :firstname, :adress, :society_description, :id )
      end

      def set_post
        @User = User.find(params[:id])
      end
      def params_image_user
        params.permit(:id, :avatar)
      end

end