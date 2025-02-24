class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :movie

  before_save :set_total_price
  after_save :calculate_awarded_points
  before_save :apply_discount, if: -> { total_price > 150 && points_used.to_i > 0 }
  after_save :update_points

  private

  def set_total_price
    if movie && movie.price
      self.total_price = movie.price
    else
      errors.add(:movie, "är ogiltig eller saknar pris")
      throw(:abort) 
    end
  end

  def calculate_awarded_points
    if points_used.to_i > 0
      self.points_awarded = 0
    elsif movie && movie.category
      case movie.category 
      when "Nya utgåvor" then self.points_awarded = 20
      when "Vanliga filmer" then self.points_awarded = 10
      when "Gamla filmer" then self.points_awarded = 5
      else 0
      end
    else
      errors.add(:movie, "saknar kategori")
      throw(:abort)
    end
  end

  def update_points
    customer.points ||= 0
    customer.points += points_awarded.to_i if points_awarded
    customer.points = [customer.points, 0].max
    customer.save!
  end

  def apply_discount
    if points_used > customer.points
      errors.add(:points_used, "du har inte tillräckligt med poäng")
      throw(:abort)
    end

    discount = points_used
    self.total_price -= discount
    customer.points -= points_used
    customer.save!
  end
end