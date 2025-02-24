require "test_helper"

class MovieTest < ActiveSupport::TestCase
   test "price for a movie should be based on category" do
     movie = Movie.create(title:"Beyond the spider-verse", category: "Nya utgåvor")

     assert movie.persisted?, "Movie should be saved successfully"
     assert_equal 200, movie.price, "Price should be 200 for 'Nya utgåvor'"
   end
end
