class JobsController < ApplicationController
  before_action :fetch_cache
  before_action :fetch_cache_file, only: [:cache_file_jobs]


  def cache_file_jobs
    @jobs = Job.where(cache_id: @cache.id, cache_file_name: @cache_file.name)
    render json: @jobs
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end


  def create
    cf = CacheFile.find_or_create_by name: (params[:cache_file_name])
    cf.cache_id = 1 # Hardcoding a relation to a cache for now for simplicity sake
    cf.save
    if params[:type] == 'stage'
      unless cf.status == 'staging' || cf.status == 'staged'
        # Calling stage with delay will cause it to be managed by delayed_job
        cf.delay.stage
        puts "Job created to #{params[:type]} #{params[:cache_file_name]} to #{params[:cache_name]}"
      else
        puts " #{params[:cache_file_name]} already in #{params[:cache_name]}"
      end
    elsif params[:type] == 'unstage'
      # Calling unstage with delay will cause it to be managed by delayed_job
      cf.delay.unstage
    elsif params[:type] == 'fixity'
      # TODO
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

  private
    def fetch_cache
      @cache = Cache.where(name: params["cache_name"]).first
      raise ActiveRecord::RecordNotFound, "No cache by name of '#{params["cache_name"]}' was found" if @cache.nil?
    end

    def fetch_cache_file
      @cache_file = CacheFile.where(name: params["cache_file_name"], cache_id: @cache.id).first
      raise ActiveRecord::RecordNotFound, "No file by name of '#{params["cache_file_name"]}' found in cache #{cache.name}" if @cache_file.nil?
    end

    def fetch_job
      @job
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:identifier)
    end
end
