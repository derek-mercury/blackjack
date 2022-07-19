
module Blackjack where

data Suit = Clubs
            | Diamonds
            | Hearts
            | Spades
            deriving (Show)
data Rank = Ace
            | Two
            | Three
            | Four
            | Five
            | Six
            | Seven
            | Eight
            | Nine
            | Ten
            | Jack
            | Queen
            | King
            deriving (Show)

data Card = Card Suit Rank
            deriving (Show)

-- create list of card objects, 13 of each
-- createDeck = [Card Clubs 1, .., Card Clubs 13]

-- convert Rank to actual Num
getCardValue:: Rank -> Int
getCardValue c = case c of 
    Ace -> 1
    Two -> 2
    Three -> 3
    Four -> 4
    Five -> 5
    Six -> 6
    Seven -> 7
    Eight -> 8
    Nine -> 9
    Ten -> 10
    Jack -> 11
    Queen -> 12
    King -> 13
    -- c == Ace -> 13

-- get value of hand
getOptimalHandValue :: Card -> Card -> Int
getOptimalHandValue (Card _ rank1) (Card _ rank2)
    -- the only ever time we want to make Ace = 13 is when
    | (val1 == 1 || val2 == 1) && val1 + val2 + 12 <= 21 = val1 + val2 + 12
    | otherwise = val1 + val2

    where
        val1 = getCardValue rank1
        val2 = getCardValue rank2
