class Souscategorie < ApplicationRecord
    validates_presence_of :sous_categorie_name
    belongs_to :categorie
    has_many :competences, class_name: 'Competence', dependent: :destroy
    has_many :offre_categories, class_name: 'OffreCategorie', dependent: :destroy
    def formatted_created_at
        created_at.strftime("%d %b %Y %H:%M:%S")
    end
    def formatted_updated_at
        updated_at.strftime("%d %b %Y %H:%M:%S")
    end
end