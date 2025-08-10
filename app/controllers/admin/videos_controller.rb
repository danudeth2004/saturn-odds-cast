class Admin::VideosController < ApplicationController
  before_action :set_admin_video, only: %i[ show edit update destroy ]

  # GET /admin/videos or /admin/videos.json
  def index
    @videos = Video.all
  end

  # GET /admin/videos/1 or /admin/videos/1.json
  def show
  end

  # GET /admin/videos/new
  def new
    @video = Video.new
  end

  # GET /admin/videos/1/edit
  def edit
  end

  # POST /admin/videos or /admin/videos.json
  def create
    @video = Video.new(admin_video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/videos/1 or /admin/videos/1.json
  def update
    respond_to do |format|
      if @video.update(admin_video_params)
        format.html { redirect_to @video, notice: "Video was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/videos/1 or /admin/videos/1.json
  def destroy
    @video.destroy!

    respond_to do |format|
      format.html { redirect_to admin_videos_path, notice: "Video was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_video
      @video = Video.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_video_params
      params.expect(admin_video: [ :title, :youtube_link, :short_description ])
    end
end
