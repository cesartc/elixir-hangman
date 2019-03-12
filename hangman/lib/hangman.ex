defmodule Hangman do

  alias Hangman.Game

  def hello do
    IO.puts Dictionary.random_word
  end

  # def new_game() do
  #   Game.new_game()
  # end
  defdelegate new_game(), to: Game
end
