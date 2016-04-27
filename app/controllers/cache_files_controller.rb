class CacheFilesController < ApplicationController
  before_action :set_cache_file, only: [:show, :edit, :update, :destroy]

  # GET /cache_files
  # GET /cache_files.json
  def index
    @cache_files = CacheFile.all
  end

  # GET /cache_files/1
  # GET /cache_files/1.json
  def show
  end

  # GET /cache_files/new
  def new
    @cache_file = CacheFile.new
  end

  # GET /cache_files/1/edit
  def edit
  end

  # POST /cache_files
  # POST /cache_files.json
  def create
    @cache_file = CacheFile.new(cache_file_params)

    respond_to do |format|
      if @cache_file.save
        format.html { redirect_to @cache_file, notice: 'Cache file was successfully created.' }
        format.json { render :show, status: :created, location: @cache_file }
      else
        format.html { render :new }
        format.json { render json: @cache_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cache_files/1
  # PATCH/PUT /cache_files/1.json
  def update
    respond_to do |format|
      if @cache_file.update(cache_file_params)
        format.html { redirect_to @cache_file, notice: 'Cache file was successfully updated.' }
        format.json { render :show, status: :ok, location: @cache_file }
      else
        format.html { render :edit }
        format.json { render json: @cache_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cache_files/1
  # DELETE /cache_files/1.json
  def destroy
    @cache_file.destroy
    respond_to do |format|
      format.html { redirect_to cache_files_url, notice: 'Cache file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cache_file
      @cache_file = CacheFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cache_file_params
      params.fetch(:cache_file, {})
      params.require(:cache_file).permit(:name, :cache_id, :status, :url)
    end
end
