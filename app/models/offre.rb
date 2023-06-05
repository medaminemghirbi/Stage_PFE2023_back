class Offre < ApplicationRecord
    validates_presence_of :titre_offre, :description, :start_date, :type_offre
    enum niveau_etude: %i[MoinsBac Bac Bac+1 Bac+2 Bac+3 Bac+4 Bac+5 Mastere Ingenieur PlusqueBac+5 Formation Autre]
    enum type_contrat: %i[CDI CDD CAE CUI CIE Sivp]
    enum experience: %i[Begginer Junior Confirmed Senior]

    enum type_offre: %i[Emploi Freelance Stage]
    belongs_to :user
    has_many :offre_categories, class_name: 'OffreCategorie', dependent: :destroy
    has_many :favoris, class_name: 'Favori', dependent: :destroy
    has_many :candidatures, class_name: 'Candidature', dependent: :destroy

    def formatted_created_at
        created_at.strftime("%d %b %Y %H:%M:%S")
        updated_at.strftime("%d %b %Y %H:%M:%S")
    end


end
