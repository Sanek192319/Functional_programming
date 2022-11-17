module Main where

import Functions as Functions
import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))

main :: Effect Unit
main = do
  log $ "\n"
  log $ "Task1 "
  log $ show $ Functions.findIndex ((==) 3) (1 : 2 : 3 : 4 : Nil)

  log $ "\n"
  log $ "Task2 "
  log $ show $ Functions.findLastIndex (_ == 3) (1 : 2 : 3 : 4 : 3 : Nil)
  log $ show $ Functions.findLastIndex (_ == 3) (1 : 2 : 4 : 5 : Nil)
  log $ show $ Functions.findLastIndex (_ == 3) Nil

  log $ "\n"
  log $ "Task3 "
  log $ show $ Functions.zip (1 : 2 : 3 : Nil) (4 : 5 : 6 : Nil)

  log $ "\n"
  log $ "Task4 "
  log $ show $ Functions.unzip (Tuple 1 2 : Tuple 3 4 : Nil)
  log $ show $ Functions.unzip (Tuple 1 "a" : Tuple 2 "b" : Tuple 3 "c" : Nil)

  log $ "\n"
  log $ "Task5 "
  log $ show $ Functions.filter (\x -> x > 2) (1 : 2 : 3 : 4 : Nil)
  log $ show $ Functions.filter (\x -> x > 2) (1 : 2 : Nil)
  log $ show $ Functions.filter (\x -> x > 2) Nil   

  log $ "\n"
  log $ "Task6 "
  log $ show $ Functions.tailRecursionFilter (\x -> x `mod` 2 == 0) (1 : 2 : 3 : 4 : Nil) Nil
  log $ show $ Functions.tailRecursionFilter (\x -> x `mod` 2 == 0) (1 : 2 : 3 : 4 : Nil) Nil == (2 : 4 : Nil)

  log $ "\n"
  log $ "Task7 "
  log $ show $ Functions.take 3 (1 : 2 : 3 : 4 : 5 : Nil)
  log $ show $ Functions.take 3 (1 : 2 : Nil)

  log $ "\n"
  log $ "Task8 "
  log $ show $ Functions.tailRecursionTake 3 (1 : 2 : 3 : 5 : Nil)
  log $ show $ Functions.tailRecursionTake 3 (1 : 2 : Nil)
  