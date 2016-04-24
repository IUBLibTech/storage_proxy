module StorageApi
  class CacheFilesController < ApplicationController
    before_filter :set_cache
    before_action :set_cache_file, only: [:show, :edit, :update, :destroy]

    # GET /caches
    # GET /caches.json
    def index
      @cache_files = CacheFile.all
      render json: @cache_files
    end

    # GET /caches/1
    # GET /caches/1.json
    def show
      render json: @cache_file
    end

    private
      # Use callbacks to share common setup or constraints between actions.

      def set_cache_file
        unless params[:cache_id].nil?
          @cache_file = @cache.cache_files.find(params[:id])
        else
          @cache_file = CacheFile.find(params[:id])
        end
      end

      def set_cache
        unless params[:cache_id].nil?
          @cache = Cache.find(params[:cache_id])
        end
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def cache_params
        params.require(:cache).permit(:name)
      end
  end
end