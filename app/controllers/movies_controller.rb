class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  TMD_API_KEY = Rails.application.credentials.dig(:tmdb, :api_key)

  # GET /movies or /movies.json
  def index
    @movies = Movie.all

  end

  def search
    query = params[:search].gsub(' ', '+') unless params[:search].nil?
    response = HTTP.get("https://api.themoviedb.org/3/search/movie?api_key=#{TMD_API_KEY}&language=en-US&query=#{query}&page=1&include_adult=false")
    json_parse = JSON.parse(response)
    @results = json_parse["results"] 
    @small_poster = "https://www.themoviedb.org/t/p/w150_and_h225_bestv2/"


  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    #@movie = Movie.new(movie_params)
    response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie_params[:tmdb_id]}?api_key=#{TMD_API_KEY}&language=en-US")
    json_parse = JSON.parse(response)

    @movie = Movie.new(tmdb_id: movie_params[:tmdb_id], name: json_parse["original_title"], info: response)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:tmdb_id, :name, :info)
    end
end
