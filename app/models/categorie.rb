class Categorie < ApplicationRecord
    validates_presence_of :categorie_name
    belongs_to :domain
    has_many :sous_categorie, class_name: 'Souscategorie', dependent: :destroy
    def formatted_created_at
        created_at.strftime("%d %b %Y %H:%M:%S")
    end
    def formatted_updated_at
        updated_at.strftime("%d %b %Y %H:%M:%S")
    end
end