defmodule Cards do

  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """


@doc """
Returns a list of strings representing a deck of playing cards
"""
def create_deck do
  values = ["Ace","Two","Three","Four","Five"]
  suits = ["Spades","Hearts","Diamonds","Clubs"]

  # option number one
  # cards = for value <- values  do
  #   for suit <- suits  do
  #     "#{value} for #{suit}"
  #   end
  # end

  # List.flatten(cards)

  # option number two

  for value <- values, suit <- suits  do
    "#{value} of #{suit}"
  end
end

def suffle(deck) do
  Enum.shuffle(deck)
end


@doc """
  Determines wheter a deck contains a given card

## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck,"Ace of Spades")
      true
"""
def contains?(deck, card) do
  Enum.member?(deck,card)
end

@spec deal(any, integer) :: {list, list}
@doc """
  Devides a deck into a hand and remainder of the deck.
  The `hand_size` argument indicates how many cards should
  be in the hand.

##  Example

    iex> deck = Cards.create_deck
    iex> {hand,_deck} = Cards.deal(deck,2)
    iex> hand
    ["Ace of Spades","Ace of Hearts"]
"""
def deal(deck,hand_size) do
  Enum.split(deck,hand_size)
end

def save(deck, file_name) do
  binary = :erlang.term_to_binary(deck)
  File.write(file_name,binary)
end

def load(filename) do
  # {status,binary} = File.read(filename)
  case File.read(filename) do
     {:ok, binary} -> :erlang.binary_to_term(binary)
     {:error, _reason} -> "that file does not exist"
  end
end

def create_hands(hand_size) do
  Cards.create_deck
  |> Cards.suffle
  |> Cards.deal(hand_size) # the first parameter otomaticaly fill by deck
end
end
