class Candidature < ApplicationRecord
    validates_presence_of :user_id, :offre_id
    enum etat: %i[Encours Accepted Interview Refused]
    belongs_to :offre
    belongs_to :user
    def formatted_created_at
        interview_date.strftime("%b %d, %Y at %H:%M") if interview_date    end
        def formatted_created_at2
            date_postulation.strftime("%b %d, %Y at %H:%M") if date_postulation    end
end
