class StreamersController < ApplicationController
  before_action :set_streamer, only: %i[ show edit update destroy ]

  # GET /streamers or /streamers.json
  def index
    @streamers = Streamer.all
  end

  # GET /streamers/1 or /streamers/1.json
  def show
  end

  # GET /streamers/new
  def new
    @streamer = Streamer.new
  end

  # GET /streamers/1/edit
  def edit
  end

  # POST /streamers or /streamers.json
  def create
    @streamer = Streamer.new(streamer_params)

    respond_to do |format|
      if @streamer.save
        format.html { redirect_to streamer_url(@streamer), notice: "Streamer was successfully created." }
        format.json { render :show, status: :created, location: @streamer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @streamer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /streamers/1 or /streamers/1.json
  def update
   p params[:streamer]

    respond_to do |format|
      if @streamer.update(streamer_params)
        format.html { redirect_to streamer_url(@streamer), notice: "Streamer was successfully updated." }
        format.json { render :show, status: :ok, location: @streamer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @streamer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streamers/1 or /streamers/1.json
  def destroy
    @streamer.destroy

    respond_to do |format|
      format.html { redirect_to streamers_url, notice: "Streamer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_streamer
      @streamer = Streamer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def streamer_params
      params.fetch(:streamers, {})
    end
end
