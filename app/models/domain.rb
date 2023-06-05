class Domain < ApplicationRecord
    validates_presence_of :domain_name
    has_many :categories, class_name: 'Categorie', dependent: :destroy

    def formatted_created_at
        created_at.strftime("%d %b %Y %H:%M:%S")
    end
    def formatted_updated_at
        updated_at.strftime("%d %b %Y %H:%M:%S")
    end
end
