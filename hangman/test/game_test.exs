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

  test "state isn't changed for :won game" do
    game = Game.new_game
    game = Map.put(game, :game_state, :won)
    { new_game, _ } = Game.make_move(game, 'whatever')
    assert new_game == game
  end

  test "state isn't changed for :won game [refactored]" do
    game = Game.new_game
      |> Map.put(:game_state, :won)

    assert { ^game, _ } = Game.make_move(game, 'whatever')
  end

  test "state isn't changed for :lost game [refactored]" do
    game = Game.new_game
      |> Map.put(:game_state, :lost)
    assert { ^game, _ } = Game.make_move(game, 'whatever')
  end

  test "state isn't changed for :won or :lost game [refactored]" do
    for state <- [:won, :lost] do
      game = Game.new_game
        |> Map.put(:game_state, state)
      assert { ^game, _ } = Game.make_move(game, 'whatever')
    end
  end


  test "first occurence of letter is not already used" do
    game = Game.new_game
    {game, score} = Game.make_move(game, "a")
    assert game.game_state != :already_used
  end

  test "second occurence of letter is already used" do
    game = Game.new_game
    {game, score} = Game.make_move(game, "a")
    {game, score} = Game.make_move(game, "a")
    assert game.game_state == :already_used
  end


end
