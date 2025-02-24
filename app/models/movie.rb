class Movie < ApplicationRecord
    validates :title, :category, :price, presence: true
    validates :price, numericality: { greater_than: 0 }
  
    before_validation :set_price

    CATEGORIES = {
      "Nya utgåvor" => { price: 200 },
      "Vanliga filmer" => { price: 100 },
      "Gamla filmer" => { price: 50 }
    }.freeze
  
    def set_price
      if category.present? && CATEGORIES.key?(category)
      category_data = CATEGORIES[category]
        self.price = category_data[:price]
      else
        errors.add(:category, "är ogiltig")
        throw(:abort)
      end
    end
  end
  