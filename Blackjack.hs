module Blackjack where
import Data.List

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
            deriving (Show, Eq)

data Card = Card { suit:: Suit, rank:: Rank }
            deriving (Show)

-- create list of card objects, 13 of each
-- createDeck = [Card Clubs 1, .., Card Clubs 13]

-- convert Rank to actual Num
getRankValue:: Rank -> Int
getRankValue c = case c of 
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
    Jack -> 10
    Queen -> 10
    King -> 10
    -- c == Ace -> 11

-- get value of hand
getOptimalHandValue :: [Card] -> Int
getOptimalHandValue cards = go initialValue aces
    where
        go n [] = n
        go n [_] = if n + 11 > 21
            then n + 1
            else n + 11
        go n (_ : tail) = go (n + 1) tail

        f (Card _ rank) = rank == Ace
        (aces, othercards) = partition f cards

        initialValue = sum [getRankValue $ rank r | r <- othercards]
        main = print initialValue


-- -- tests
-- t1 = [ Card Clubs Ace, Card Clubs Three, Card Clubs Jack, Card Clubs Two]   -- 1 + 3 + 10 + 2 = 16
-- t2 = [ Card Clubs Ace, Card Spades Ace, Card Clubs Queen]                   -- 1 + 1 + 10 = 12
-- t3 = [ Card Clubs Ace, Card Spades Jack]                                    -- 10 + 11 = 21
-- t4 = [ Card Clubs Ace, Card Spades Ace]                                     -- 1 + 1 = 12