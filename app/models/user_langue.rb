class UserLangue < ApplicationRecord
    validates_presence_of :niveau
    belongs_to :user
    belongs_to :langue
    enum niveau: %i[A1 A2 B1 B2 C1 C2]

end
