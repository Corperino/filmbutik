class CustomersController < ApplicationController
  def index
    render json: Customer.all
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: customer, status: :created
    else
      render json: customer.errors, status: :unprocessable_entity
    end
  end

  def delete
    customer = Customer.find(params[:id])
    if customer.destroy
      head :no_content
    else
      render json: { error: 'Kunde inte radera kunden' }, status: :unprocessable_entity
    end
  end

  def update_points
    customer = Customer.find(params[:id])
    if customer
      points_to_change = params[:points].to_i
      customer.points += points_to_change

      if customer.save
        render json: customer, status: :ok
      else
        render json: customer.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Kund hittas inte' }, status: :not_found
    end
  end

  private

  def customer_params
    params.permit(:name, :points)
  end
end
