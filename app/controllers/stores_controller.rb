class StoresController < ApplicationController
  before_action :set_store, only: [:show, :files]

  def index
    @stores = Store.all
    render json: @stores
  end

  def show
    render json: @store
  end

  def files
    render json: @store.media_files
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find_by name: (params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name)
    end
end
