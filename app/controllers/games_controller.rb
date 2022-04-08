require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    letter = []
    vowels = ["a", "e", "i", "o", "u"]
    8.times { letter << ('a'..'z').to_a[rand(26)] }
    letter << vowels.sample(2)
    @letters = letter.flatten.shuffle
  end

  def score
    a = params[:letters].split(" ")
    b = params[:word].split(//)

    response = URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    json = JSON.parse(response.read)
    uk_word = json['found']

    if (b - a).empty? && uk_word == true
      @score = "Congratulations! #{params[:word].upcase} is a valid English word!"
      @points = params[:word].length
    elsif (b - a).present?
      @score = "Sorry but #{params[:word].upcase} can't be built with the letters: #{params[:letters]}"
      @points = "0"
    else
      @score = "Sorry but #{params[:word].upcase} is not an English word"
      @points = "0"
    end
  end
end
