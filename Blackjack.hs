module Blackjack where

data Suit = Clubs
            | Diamonds
            | Hearts
            | Spades
            deriving (Show)
data Number = Ace
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

data Card = Card Suit Number
            deriving (Show)