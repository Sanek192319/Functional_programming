module Functions where


import Prelude

import Effect (Effect)
import Effect.Console (log)

import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))


findIndex :: forall a. (a -> Boolean) -> List a -> Maybe Int
findIndex _ Nil = Nothing
findIndex f (x : xs) = if f x then Just 0 else map ((+) 1) (findIndex f xs)

findLastIndex :: forall a. (a -> Boolean) -> List a -> Maybe Int
findLastIndex _ Nil = Nothing
findLastIndex p (x : xs) = case findLastIndex p xs of
  Nothing -> if p x then Just 0 else Nothing
  Just i -> Just (i + 1)

zip :: forall a b. List a -> List b -> List (Tuple a b)
zip Nil _ = Nil
zip _ Nil = Nil
zip (Cons x xs) (Cons y ys) = Cons (Tuple x y) (zip xs ys)

unzip :: forall a b. List (Tuple a b) -> Tuple (List a) (List b)
unzip Nil = Tuple Nil Nil
unzip (Tuple a b : xs) = Tuple (a : as) (b : bs)
  where
    Tuple as bs = unzip xs
    
filter :: forall a. (a -> Boolean) -> List a -> List a
filter _ Nil = Nil
filter p (x : xs) = if p x then x : filter p xs else filter p xs

tailRecursionFilter :: forall a. (a -> Boolean) -> List a -> List a -> List a
tailRecursionFilter _ Nil acc = acc
tailRecursionFilter f (x : xs) acc = if f x then tailRecursionFilter f xs (x : acc) else tailRecursionFilter f xs acc

take :: forall a. Int -> List a -> List a
take n _ | n <= 0 = Nil
take _ Nil = Nil
take n (x : xs) = x : take (n - 1) xs

tailRecursionTake :: forall a. Int -> List a -> List a
tailRecursionTake n xs = go n xs Nil
  where
    go :: Int -> List a -> List a -> List a
    go n _ acc | n <= 0 = acc
    go _ Nil acc = acc
    go n (x : xs) acc = go (n - 1) xs (x : acc)