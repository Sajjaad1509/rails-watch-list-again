# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

# page_number = 0

# loop do
#   page_number += 1
#   url = "https://tmdb.lewagon.com/movie/top_rated"
#   movies = URI.open(url).read
#   # puts movies

#   movie = JSON.parse(movies)
#   movie_results = movie['results']
#   movie_poster = "https://image.tmdb.org/t/p/w500"

#   movie_results.each do |movie|
#     new_movie = Movie.create(title: movie['title'], overview: movie['overview'], poster_url: movie_poster + movie['poster_path'], rating: movie['vote_average'])
#     puts "#{new_movie.title} has been created!"
#   end

# if page_number == 4
#     break
#   end
# end

url = "https://tmdb.lewagon.com/movie/top_rated"
movies = URI.open(url).read
# puts movies

movie = JSON.parse(movies)
movie_results = movie['results']
movie_poster = "https://image.tmdb.org/t/p/w500"

movie_results.each do |film|
  new_movie = Movie.create(title: film['title'], overview: film['overview'], poster_url: movie_poster + film['poster_path'], rating: film['vote_average'])
  puts "#{new_movie.title} has been created!"
end

puts "#{Movie.count}"
