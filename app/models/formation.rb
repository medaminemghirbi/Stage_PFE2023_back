class Formation < ApplicationRecord
    validates_presence_of :diplome, :description, :date_debut, :date_fin, :ecole
    enum niveau_etude: %i[MoinsBac Bac Bac+1 Bac+2 Bac+3 Bac+4 Bac+5 Mastere Ingenieur PlusqueBac+5 Formation Autre]
    belongs_to :user
end
