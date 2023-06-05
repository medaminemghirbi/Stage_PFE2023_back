class OffreCategorie < ApplicationRecord
    belongs_to :offre
    belongs_to :souscategorie
end
