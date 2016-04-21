module StorageApi
  class CachesController < ApplicationController
    before_action :set_cache, only: [:show, :edit, :update, :destroy]

    # GET /caches
    # GET /caches.json
    def index
      @caches = Cache.all
    end

    # GET /caches/1
    # GET /caches/1.json
    def show
    end

    # GET /caches/new
    def new
      @cache = Cache.new
    end

    # GET /caches/1/edit
    def edit
    end

    # POST /caches
    # POST /caches.json
    def create
      @cache = Cache.new(cache_params)

      respond_to do |format|
        if @cache.save
          format.html { redirect_to @cache, notice: 'Cache was successfully created.' }
          format.json { render :show, status: :created, location: @cache }
        else
          format.html { render :new }
          format.json { render json: @cache.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /caches/1
    # PATCH/PUT /caches/1.json
    def update
      respond_to do |format|
        if @cache.update(cache_params)
          format.html { redirect_to @cache, notice: 'Cache was successfully updated.' }
          format.json { render :show, status: :ok, location: @cache }
        else
          format.html { render :edit }
          format.json { render json: @cache.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /caches/1
    # DELETE /caches/1.json
    def destroy
      @cache.destroy
      respond_to do |format|
        format.html { redirect_to caches_url, notice: 'Cache was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cache
        @cache = Cache.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def cache_params
        params.require(:cache).permit(:name)
      end
  end
end