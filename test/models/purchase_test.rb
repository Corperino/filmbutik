require "test_helper"

class PurchaseTest < ActiveSupport::TestCase
  def setup
    @guest = Customer.find_or_create_by(id: 0, name: 'Guest', points: 0)
  end

   test "Should not be able to create a purchase without a movie" do

     customer1 = Customer.create(name: "Eddie Murphy", points: 0)
     purchase_no_movie = Purchase.create(customer_id: customer1.id);

     assert_not purchase_no_movie.valid?, "Purchase without movie should be invalid"
   end
   
   test "Should be able to create a purchase with customer and movie" do
    movie2 = Movie.create(title: "Shrek", category: "Vanliga filmer")
    customer2 = Customer.create(name: "Eddie Murphy", points: 0)
    valid_purchase = Purchase.create(movie_id: movie2.id, customer_id: @guest.id);

    assert valid_purchase.valid?, "Purchase with both customer and movie should be valid."
   end

   test "Using points should lower the total price" do
    movie3 = Movie.create(title: "Shrek 2", category: "Nya utgåvor")
    customer3 = Customer.create(name: "Eddie Murphy", points: 20)
    discount_purchase = Purchase.create(movie_id: movie3.id, customer_id: customer3.id, points_used: 20)

    assert_equal 0, customer3.reload.points, "The customer should not have anymore points"
    assert_equal 180, discount_purchase.reload.total_price, "The price with the discount should be 180"
   end 
end
