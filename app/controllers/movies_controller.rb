class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :set_posters
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

  end

  # GET /movies/1 or /movies/1.json
  def show
    response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie_params[:tmdb_id]}/watch/providers?api_key=#{TMD_API_KEY}")
    @streamers = JSON.parse(response)
  end

  def view_movie
    @json_movie = HTTP.get("https://api.themoviedb.org/3/movie/#{movie_params[:tmdb_id]}?api_key=#{TMD_API_KEY}&language=en-US")
    @movie = JSON.parse(@json_movie)
    response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie_params[:tmdb_id]}/watch/providers?api_key=#{TMD_API_KEY}")
    @streamers = JSON.parse(response)
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
    if Movie.where(tmdb_id: params[:tmdb_id]).present?
      @movie = Movie.find_by(tmdb_id: params[:tmdb_id])
      Save.create(user: current_user, movie: @movie) unless Save.where(user_id: current_user.id, movie_id: @movie.id).present?
      action = "saved"
    else
      @movie = Movie.new(movie_params)
      Save.create(user: current_user, movie: @movie)
      action = "created"
    end

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully #{action}" }
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

    def set_posters
      @large_poster = "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/"
      @small_poster = "https://www.themoviedb.org/t/p/w150_and_h225_bestv2/"
    end
    # Only allow a list of trusted parameters through.
    def movie_params
      params.permit(:id, :tmdb_id, :name, :runtime, :release, :imdb, :poster)
    end
end
