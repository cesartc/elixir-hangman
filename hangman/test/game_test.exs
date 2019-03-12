defmodule GameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "new_game returns structure" do
    game = Game.new_game
    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  # Add a test that checks that each element
  # of the letters list is a lower-case ASCII
  # character (“a” to “z”).

  test "All letters in the game must be lower-case" do
    game = Game.new_game
    word = List.to_string(game.letters)
    assert word == String.downcase(word)
  end

end
