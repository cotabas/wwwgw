class ApplicationController < ActionController::Base
  $tmd_api_key = Rails.application.credentials.dig(:tmdb, :api_key)
  $large_poster = "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/"
  $small_poster = "https://www.themoviedb.org/t/p/w150_and_h225_bestv2/"
  $logo = "https://www.themoviedb.org/t/p/original/"
  $streamers = {
    :disney => 337,
    :prime => 9,
    :paramount => 531,
    :netflix => 8

  }
  helper_method :streamy

  def streamy(movie)
    response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie}/watch/providers?api_key=#{$tmd_api_key}")
    return JSON.parse(response)["results"]["US"]["flatrate"] || {} 
  end

end
