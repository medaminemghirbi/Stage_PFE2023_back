class Certification < ApplicationRecord
    validates_presence_of :certification_name, :etablissement, :date_certif
    belongs_to :user
end
