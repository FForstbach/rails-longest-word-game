class GameController < ApplicationController

  p ALPHABET = ('A'..'Z').to_a

  def game

    # generate grid
    # show grid on GAME view
    @grid = []
    length_grid = (5..10).to_a.sample
    (1..length_grid).each do |n|
      @grid << ALPHABET.sample
    end
    session[:grid] = @grid
  end

  def score
    @grid = session[:grid]
    @word = params[:word_value].strip.upcase.split("")

    # is word in array?
    if (@word - @grid).empty?
      # is word really english? >> API
      # TODO: translate into french
      @word = @word.join("").downcase
      key = "a2427b65-0399-46eb-a812-66211c0e90c5"
      url = "https://api-platform.systran.net/translation/text/translate?source=en&target=en&key=#{key}&input=#{@word}"
      translated_word = JSON.parse(open(url).read)
      return translated_word["outputs"][0]["output"]


      # calculate length of word SCORE
      word_length = @word.length
      @word_length_score = word_length * 8

      # calculate time SCORE
      ## calculate time needed
      @time = params[:time_value]
      @time_score = @time.to_i * 2

      @word = "\"#{@word.join("")}\""

      return @total_score = @word_length_score - @time_score

    else
      @word = "\"#{@word.join("")}\""
      return "0"
    end
  end
end
