class Competence < ApplicationRecord
    validates_presence_of :niveau
    belongs_to :user
    belongs_to :souscategorie
end
