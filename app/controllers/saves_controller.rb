class SavesController < ApplicationController
  before_action :set_safe, only: %i[ show edit update destroy ]

  # GET /saves or /saves.json
  def index
    @saves = Save.all
  end

  # GET /saves/1 or /saves/1.json
  def show
  end

  # GET /saves/new
  def new
    @safe = Save.new
  end

  # GET /saves/1/edit
  def edit
  end

  # POST /saves or /saves.json
  def create
    @safe = Save.new(safe_params)

    respond_to do |format|
      if @safe.save
        format.html { redirect_to safe_url(@safe), notice: "Save was successfully created." }
        format.json { render :show, status: :created, location: @safe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @safe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saves/1 or /saves/1.json
  def update
    respond_to do |format|
      if @safe.update(safe_params)
        format.html { redirect_to safe_url(@safe), notice: "Save was successfully updated." }
        format.json { render :show, status: :ok, location: @safe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @safe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saves/1 or /saves/1.json
  def destroy
    @safe.destroy

    respond_to do |format|
      format.html { redirect_to "/user/#{current_user.id}", notice: "Save was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_safe
      @safe = Save.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def safe_params
      params.fetch(:safe, {})
    end
end
