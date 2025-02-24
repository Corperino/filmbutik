class PurchasesController < ApplicationController
    def index
      render json: Purchase.all
    end
    def create
      customer = Customer.find(params[:customer_id]) ||  Customer.find_or_create_by(id: 0, name: 'Guest', points: 0)
      movie = Movie.find(params[:movie_id])
      
      purchase = customer.purchases.new(movie: movie, total_price: movie.price)
  
      if params[:points_used].to_i > 0 && self.total_price > 150 && customer.points >= params[:points_used].to_i
        purchase.points_used = params[:points_used].to_i
        purchase.total_price -= points_used
          customer.points -= points_used
      end
  
      if purchase.save
        render json: purchase, status: :created
      else
        render json: purchase.errors, status: :unprocessable_entity
      end
      end
    end
      
      private
      
      def purchase_params
        params.permit(:customer_id, :movie_id, :points_used)
      end
  end