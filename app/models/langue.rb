class Langue < ApplicationRecord
    validates_presence_of :langue_name
    has_many :user_langues, class_name: 'UserLangue', dependent: :destroy
end
