class MediaFilesController < ApplicationController
  before_action :set_store
  before_action :set_media_file, only: [:show]

  def index
    render json: @store.media_files
  end

  def show
    render json: @media_file
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_file
      @media_file = @store.media_files.find_by name: (params[:media_file_name])
    end

    def set_store
      @store = Store.find_by name: (params[:store_name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_file_params
      params.require(:media_file).permit(:name, :store_id)
    end
end
