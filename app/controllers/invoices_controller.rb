class InvoicesController < ApplicationController
    def create
      invoice = Invoice.new(customer_id: params[:customer_id])
      purchases = Purchase.where(id: params[:purchase_ids])
  
      if purchases.empty?
        render json: { error: "Inga giltiga köp hittades" }, status: :unprocessable_entity
        return
      end
  
      invoice.purchases = purchases
  
      if invoice.save
        render json: invoice, include: { purchases: { include: :movie } }, status: :created
      else
        render json: invoice.errors, status: :unprocessable_entity
      end
    end
  
    def show
      invoice = Invoice.find(params[:id])
      render json: invoice, include: { purchases: { include: :movie } }
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Faktura ej funnen" }, status: :not_found
    end
  end