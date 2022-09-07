module Api
    class OrderDetailsController < ApplicationController
    before_action :set_order_detail, only: [:show, :update, :destroy]

    # GET /order_details
    def index
      @order_details = @order_details.page(params[:page] || 1).per(params[:per_page] || 10)
      .order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

      serial_user = @order_details.map {|order_detail| UserSerializer.new(order_detail , root: false) }
              
      response_pagination(serial_user, @order_details, 'List User')
    end

    def index
      @order_details = OrderDetail.all

      render json: @order_details
    end

    # GET /order_details/1
    def show
      render json: @order_detail
    end

    # POST /order_details
    def create
      @order_detail = OrderDetail.new(order_detail_params)

      if @order_detail.save
        render json: @order_detail, status: :created, location: @order_detail
      else
        render json: @order_detail.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /order_details/1
    def update
      if @order_detail.update(order_detail_params)
        render json: @order_detail
      else
        render json: @order_detail.errors, status: :unprocessable_entity
      end
    end

    # DELETE /order_details/1
    def destroy
      @order_detail.destroy
    end

    private

    def search_order_detail
      @order_details = if params[:search].present? && params[:search] !='{search}'
                        Order_detail.search(params[:search])
                      else
                        order_detail
                      end
      end
      
      # Use callbacks to share common setup or constraints between actions.
      def set_order_detail
        @order_detail = OrderDetail.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
    def order_detail_params
        params.require(:order_detail).permit(:order, :product, :qty, :price)
    end
 end
end