module Api
  class TestingsController < ApplicationController
    before_action :set_bookmark, only: [:show, :update, :destroy]
  
    # GET /bookmarks
    def index
      @testings = Testing.all
  
      render json: @testings
    end
  
    # GET /bookmarks/1
    def show
      render json: @testing
    end
  
    # POST /bookmarks
    def create
      @testing = testing.new(testing_params)
  
      if @testing.save
        render json: @testing, status: :created
      else
        render json: @testing.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /bookmarks/1
    def update
      if @testing.update(testing_params)
        render json: @testing
      else
        render json: @testing.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /bookmarks/1
    def destroy
      @testing.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_bookmark
        @testing = Testing.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def bookmark_params
        params.require(:testing).permit(:title, :url)
      end
  end
end
