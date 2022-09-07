module Api
    class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]
    before_action :search_order, only: %i[index]
    before_action :order_params, only: %i[create]
    skip_before_action :doorkeeper_authorize!, only: %i[index]

    # GET /orders
    # GET /orders
    # GET /orders
    # GET /orders
    # GET /orders
    def index
      @orders = @orders.page(params[:page] || 1).per(params[:per_page] || 10)
      .order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

      serial_user = @orders.map {|order| UserSerializer.new(order , root: false) }
              
      response_pagination(serial_user, @orders, 'List User')
    end
    
    def index
      @orders = Order.all

      render json: @orders
    end

    # GET /orders/1
    def show
      render json: @order
    end

    # POST /orders
    def create
      @order = Order.new(order_params)

      if @order.save
        render json: @order, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /orders/1
    def update
      if @order.update(order_params)
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    # DELETE /orders/1
    def destroy
      @order.destroy
    end

    private
    def search_order
      @order = if params[:search].present? && params[:search] !='{search}'
                Order_detail.search(params[:search])
               else
               order
              end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def order_params
        params.fetch(:order)
                .permit(:customer_id, :date, :total,
                        order_details_attributes: %i[
                        id qty price product_id order_id
                      ])
        
      end
  end
end