module Uncertain where

data Card = Ace | Number Integer | Picture 


type P a = [a]

valueCard' :: Card -> P Integer
valueCard' Ace = [1, 11]
valueCard' (Number n) = [n]
valueCard' Picture = [10]

composeP :: (b -> P c) -> (a -> P b) -> (a -> P c)
composeP f g x = [ z | y <- g x, z <- f y]

addP :: P Integer -> P Integer  -> P Integer
addP xs ys = [ x + y  | x <- xs, y <- ys]

valueHand' :: [Card] -> P Integer
valueHand' [] = [0]
valueHand' (x:xs) = valueCard' x   `addP` valueHand' xs


valueCard :: Card -> Integer
valueCard Ace = 1
valueCard (Number n) = n
valueCard Picture = 10

valueHand :: [Card] -> Integer
valueHand [] = 0
valueHand (x:xs) = valueCard x + valueHand xs

