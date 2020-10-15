require 'pry'
require 'bundler'
Bundler.require
$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'board'
require 'board_case'
require 'game'
require 'player'
require 'show'


# Orchestre le jeu !
class Application
  def perform
    game = Game.new
    while game.check_token == true
      while game.is_the_game_stop? == false
      system('clear')
      game.turn
      game.switch_turn
      end
      game.switch_turn
      game.end
      game.new_round
    end
  end
end


Application.new.perform
