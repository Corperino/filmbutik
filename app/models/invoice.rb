class Invoice < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :purchases

  before_save :calculate_price

  private

  def calculate_price
    if purchases.any?
      self.total_price = purchases.sum(&:total_price)
    else
      self.total_price = 0
    end
  end
end
