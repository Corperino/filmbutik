require "test_helper"

class InvoiceTest < ActiveSupport::TestCase
   def setup
      @guest = Customer.find_or_create_by(id: 0, name: 'Guest', points: 0)
    end
   test "should create invoice with total price" do
   
    movie1 = Movie.create(title: "The Nice guys", category: "Vanliga filmer")
    movie2 = Movie.create(title: "The fall guy", category: "Nya utgåvor")

    purchase1 = Purchase.create(movie_id: movie1.id, customer_id: @guest.id)
    purchase2 = Purchase.create(movie_id: movie2.id, customer_id: @guest.id)

    invoice = Invoice.create(customer_id: @guest.id, purchase_ids: [purchase1.id, purchase2.id])

    assert invoice.valid?, "The invoice should be valid"
    assert_equal 300, invoice.total_price, "The total price for both movies should be 300"
   end
end
