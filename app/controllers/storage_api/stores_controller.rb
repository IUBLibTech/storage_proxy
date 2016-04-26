module StorageApi
  class StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update, :destroy]

    # GET /stores
    # GET /stores.json
    def index
      @stores = Store.all
      render json: @stores
    end

    # GET /stores/1
    # GET /stores/1.json
    def show
      render json: @store
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_store
        @store = Store.find_by name: (params[:store_name])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def store_params
        params.require(:store).permit(:name)
      end
  end
end