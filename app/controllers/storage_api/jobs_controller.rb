module StorageApi
  class JobsController < ApplicationController
    before_action :set_job, only: [:show, :edit, :update, :destroy]

    # GET /jobs
    # GET /jobs.json
    def index
      @jobs = Job.all
    end

    # GET /jobs/1
    # GET /jobs/1.json
    def show
    end

    # GET /jobs/new
    def new
      @job = Job.new
    end

    # GET /jobs/1/edit
    def edit
    end

    # POST /jobs
    # POST /jobs.json
    def create_orig
      @job = Job.new(job_params)

      respond_to do |format|
        if @job.save
          format.html { redirect_to @job, notice: 'Job was successfully created.' }
          format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end

    def create
      #puts "Job created to #{params[:type]} #{params[:cache_file_name]} to #{params[:cache_name]}"
      cf = CacheFile.find_or_create_by name: (params[:cache_file_name])
      cf.cache_id = 1 # Hardcoding a relation to a cache for now for simplicity sake
      cf.save
      unless cf.status == 'staging' || cf.status == 'staged'
        # Calling stage with delay will cause it to be managed by delayed_job
        cf.delay.stage
        puts "Job created to #{params[:type]} #{params[:cache_file_name]} to #{params[:cache_name]}"
      else
        puts " #{params[:cache_file_name]} already in #{params[:cache_name]}"
      end
      job_rsp = {:cache_name => params[:cache_name], :cache_file_name => params[:cache_file_name], :type => params[:type]}
      render json: job_rsp, head: :no_content
    end

    # PATCH/PUT /jobs/1
    # PATCH/PUT /jobs/1.json
    def update
      respond_to do |format|
        if @job.update(job_params)
          format.html { redirect_to @job, notice: 'Job was successfully updated.' }
          format.json { render :show, status: :ok, location: @job }
        else
          format.html { render :edit }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /jobs/1
    # DELETE /jobs/1.json
    def destroy
      @job.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_job
        @job = Job.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def job_params
        params.require(:job).permit(:identifier)
      end
  end
end