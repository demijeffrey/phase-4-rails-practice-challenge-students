class Student < ApplicationRecord

    validates :name, presence: true
    validates :age, numericality: { in: 0..18 }

    belongs_to :instructor

end
