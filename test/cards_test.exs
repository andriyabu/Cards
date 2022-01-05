defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck make 20 card" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "Suffling a deck randomizes it" do
    deck = Cards.create_deck
    assert deck != Cards.suffle(deck)
    # atau kebalikan
    refute deck == Cards.suffle(deck)
  end
end
