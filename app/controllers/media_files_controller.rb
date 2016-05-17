class MediaFilesController < ApplicationController
  before_filter :set_store
  before_action :set_media_file, only: [:show, :edit, :update, :destroy]

  # GET /media_files
  # GET /media_files.json
  def index
    @media_files = MediaFile.all
    render json: @media_files
  end

  # GET /media_files/1
  # GET /media_files/1.json
  def show
    render json: @media_file
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_file
      unless params[:store_name].nil?
        @media_file = @store.media_files.find_by name: (params[:media_file_name])
      else
        @media_file = MediaFile.find_by name: (params[:media_file_name])
      end
    end

    def set_store
      unless params[:store_name].nil?
        @store = Store.find_by name: (params[:store_name])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_file_params
      params.require(:media_file).permit(:name, :store_id)
    end
end
