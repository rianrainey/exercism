defmodule Teenager do
  def hey(input) do
    cond do
      is_shouting?(input) -> "Whoa, chill out!"
      is_question?(input) -> "Sure."
      is_forceful?(input) -> respond_whatever
      is_empty?(input) -> "Fine. Be that way!"

      true -> respond_whatever
    end
  end

  def is_shouting?(input) do
    input == String.upcase(input) && input != String.downcase(input)
  end

  def is_question?(input) do
    String.ends_with?(input, "?")
  end

  def is_forceful?(input) do
    String.ends_with?(input, "!")
  end

  def is_empty?(input) do
    String.length(String.strip(input)) == 0
  end

  def respond_whatever do
    "Whatever."
  end
end
