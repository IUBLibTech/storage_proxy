class CacheFilesController < ApplicationController
  before_action :set_cache

  def index
    render json: @cache.cache_files
  end

  def show
    cache_file = @cache.cache_files.select { |cf| cf.id.to_s == params[:id] }.first
    json = {
      'name' => cache_file.name,
      'status' => cache_file.status,
      'url' => cache_file.url
    }
    render json: json
  end

  private
    def set_cache
      @cache = Cache.find params[:cache_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cache_params
      params.require(:cache).permit(:name)
    end
end
