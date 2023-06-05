Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  resources :messages
  #add root par defaut for api
  root to: "static#home"

  #add sessions (login page )
  resources :sessions, only: [:create]

 #add registration (register page ) + confirmation de l'email
  resources :registrations, only: [:create] do
    member do
      get :confirm_email
    end
  end

   #add sign out for front
  delete :logout, to: "sessions#logout"

   #add current logged_in user  for front
  get :logged_in, to: "sessions#logged_in"

    #add domains by Admin
  resources :domains, only: %i[create index show update destroy]

    #add categories by Admin
  resources :categories, only: %i[create index show update destroy]
  get 'get_categorie_by_domain/:domain_id', to: 'categories#get_categorie_by_domain'

    #add souscategories by Admin
  resources :souscategories, only: %i[create index show update destroy]
  get 'get_sous_categorie_by_categorie/:categorie_id', to: 'souscategories#get_sous_categorie_by_categorie'

    #reset users password (freelancer / Internship / employee / admin / superadmin)
  resources :password_resets

    #add user formations (freelancer / Internship / employee)
  resources :formations, only: %i[create index show update destroy]
  get 'get_user_Formation/:user_id', to: 'formations#get_user_Formation'

  #add user certifications (freelancer / Internship / employee)
  resources :certifications, only: %i[create index show update destroy]
  get 'get_user_certification/:user_id', to: 'certifications#get_user_certification'


  #add user experiences (freelancer / Internship / employee)
  resources :experiences, only: %i[create index show update destroy]
  get 'get_user_experience/:user_id', to: 'experiences#get_user_experience'

  #add langue by Admin
  resources :langues, only: %i[create index show update destroy ]

  #add user langue (freelancer / Internship / employee)
  resources :user_langues, only: %i[create index show update destroy ]
  get 'get_user_langue/:user_id', to: 'user_langues#get_user_langue'

  #add user competence (freelancer / Internship / employee)
  resources :competences, only: %i[create index show update destroy ]
    #patch '/add_new_competence/:user_id', to: 'competences#add_new_competence'
  get 'get_user_competence/:user_id', to: 'competences#get_user_competence'


  #add offre by Admin
  resources :offres, only: %i[create index show update destroy]
  get 'get_Emploi_offre_by_Admin/:user_id', to: 'offres#get_Emploi_offre_by_Admin'
  get 'get_Freelance_offre_by_Admin/:user_id', to: 'offres#get_Freelance_offre_by_Admin'
  get 'get_Stage_offre_by_Admin/:user_id', to: 'offres#get_Stage_offre_by_Admin'
  get 'get_Active_Freelance_offre_by_Admin/:user_id', to: 'offres#get_Active_Freelance_offre_by_Admin'
  get 'get_Ended_Freelance_offre_by_Admin/:user_id', to: 'offres#get_Ended_Freelance_offre_by_Admin'

  get 'get_Active_Job_offre_by_Admin/:user_id', to: 'offres#get_Active_Job_offre_by_Admin'
  get 'get_Active_Internship_offre_by_Admin/:user_id', to: 'offres#get_Active_Internship_offre_by_Admin'

  get 'get_Stage_offre_by_Intern', to: 'offres#get_Stage_offre_by_Intern'
  get 'get_Emploi_offre_by_Jobseeker', to: 'offres#get_Emploi_offre_by_Jobseeker'
  get 'get_Freelance_offre_by_Frelancer', to: 'offres#get_Freelance_offre_by_Frelancer'
  get 'missiondata/:id', to: 'offres#missiondata'
  get 'get_All_Offers', to: 'offres#get_All_Offers'


 #add favorite offre to list  by (freelancer / Internship / employee)
  resources :favoris, only: %i[create index update destroy ]
  get 'favoris/:user_id', to: 'favoris#show'

 #add get  condidature on  offre  by user (freelancer / Internship / employee) + by  admin(offre proprity ) by offre (on offre)

  resources :candidatures, only: %i[create index update destroy ]
  get 'get_candidature_by_User/:user_id', to: 'candidatures#get_candidature_by_User'
  get 'get_freelance_candidature_by_Admin/:user_id', to: 'candidatures#get_freelance_candidature_by_Admin'
  get 'get_candidature_by_Offre/:offre_id', to: 'candidatures#get_candidature_by_Offre'
  get 'get_emploi_candidature_by_Admin/:user_id', to: 'candidatures#get_emploi_candidature_by_Admin'
  get 'get_stage_candidature_by_Admin/:user_id', to: 'candidatures#get_stage_candidature_by_Admin'

  get 'get_freelance_Interview_by_Admin/:user_id', to: 'candidatures#get_freelance_Interview_by_Admin'
  get 'get_emploi_Interview_by_Admin/:user_id', to: 'candidatures#get_emploi_Interview_by_Admin'
  get 'get_stage_Interview_by_Admin/:user_id', to: 'candidatures#get_stage_Interview_by_Admin'


 #add get all users (for SuperAdmin) + Add update image to make our platforme with image
  resources :users, only: %i[create show index update destroy ]
  patch '/update_image_user/:id', to: 'users#update_image_user'
  get 'static', to: 'static#static'


   #add get all users [admin]
  get 'get_admin_users', to: 'users#get_admin_users'
  get 'count_all_for_admin/:user_id', to: 'users#count_all_for_admin'
end
