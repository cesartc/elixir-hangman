defmodule Dictionary do
  def hello do
    IO.puts "Hello mundo"
  end

  def word_list do
    "../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end

  def word_list2 do
    File.read!("assets/words.txt")
    |> String.split(~r/\n/)
    |> length
  end

  def random_word() do
    word_list()
    |> Enum.random()
    Enum.random(word_list())
  end
end
