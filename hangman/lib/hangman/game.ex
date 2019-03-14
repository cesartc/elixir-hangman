defmodule Hangman.Game do

  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
    used: MapSet.new
  )

  def new_game() do
    %Hangman.Game{letters: Dictionary.random_word |> String.codepoints}
  end

  # def make_move(game = %{ game_state: :won }, _) do
  #   { game, current_score(game) }
  # end

  # def make_move(game = %{ game_state: :lost }, _) do
  #   { game, current_score(game) }
  # end

  def make_move(game = %{ game_state: state }, _) when state in [:won, :lost] do
    { game, current_score(game) }
  end

  def make_move(game, guess) do
    #if MapSet.member?(game, guess) do
    game = accept_move(game, guess, MapSet.member?(game.used, guess))
    { game, current_score(game)}
  end

  def accept_move(game, guess, _already_guessed = true) do
    Map.put(game, :game_state, :already_used)
  end

  def accept_move(game, guess, _already_guessed) do
    Map.put(game, :used, MapSet.put(game.used, guess))
  end

  def current_score(game) do
    123
  end

end
