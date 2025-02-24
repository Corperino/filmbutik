require "test_helper"

class CustomerTest < ActiveSupport::TestCase
   test "customers should be awarded points for purchases" do
     customer = Customer.create(name: "Conan O'Brien", points: 0)
     movie = Movie.create(title:"Rocky", category: "Vanliga filmer")
     purchase = Purchase.create(movie_id: movie.id, customer_id: customer.id);

     assert_equal 10, customer.reload.points, "The customer should have recieved 10 points"
   end
end
