module Api
class BarangsController < ApplicationController
  before_action :set_barang, only: [:show, :update, :destroy]

  # GET /barangs
  def index
        @barangs = Barang.page(params[:page] || 1).per(params[:per_page] || 10)
        .order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

        serial_user = @barangs.map {|jumlah| UserSerializer.new(jumlah, root: false) }
                
        response_pagination(serial_user, @barangs, 'List User')
      end

  # GET /barangs/1
  def show
    render json: @barang
  end

  # POST /barangs
  def create
    @barang = Barang.new(barang_params)

    if @barang.save
      render json: @barang, status: :created, 
    else
      render json: @barang.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /barangs/1
  def update
    if @barang.update(barang_params)
      render json: @barang
    else
      render json: @barang.errors, status: :unprocessable_entity
    end
  end

  # DELETE /barangs/1
  def destroy
    @barang.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barang
      @barang = Barang.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def barang_params
      params.require(:barang).permit(:jumlah, :deskripsi)
    end
end
end
