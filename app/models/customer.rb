class Customer < ApplicationRecord
    has_many :purchases
    validates :name, presence: true
    validates :points, numericality: { greater_than_or_equal_to: 0 }
end
