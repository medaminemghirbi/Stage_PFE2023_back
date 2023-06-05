class Experience < ApplicationRecord
    validates_presence_of :entreprise
    validates_presence_of :position_held
    validates_presence_of :start_date
    validates_presence_of :end_date
    belongs_to :user
end
