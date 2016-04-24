module StorageApi
  class CachesController < ApplicationController
    before_action :set_cache, only: [:show, :edit, :update, :destroy]

    # GET /caches
    # GET /caches.json
    def index
      @caches = Cache.all
      render json: @caches
    end

    # GET /caches/1
    # GET /caches/1.json
    def show
      render json: @cache
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cache
        @cache = Cache.find_by name: (params[:name])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def cache_params
        params.require(:cache).permit(:name)
      end
  end
end