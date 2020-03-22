require 'set'

#in-flight entertainment --> blog 3/21/20

def can_watch_two_movies?(flight_duration, movie_arr)

  movie_set = Set.new

  movie_arr.each do |first_movie|

    second_movie = flight_duration - first_movie

    if movie_set.include?(second_movie)
      return true
    else
      movie_set.add(first_movie)
    end
  end
  return false
end
