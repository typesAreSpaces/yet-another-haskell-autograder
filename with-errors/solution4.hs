-- Exercise 6
dot :: Num a => [a] -> [a] -> a
dot [] [] = 0
dot [] _ = 0
dot _ [] = 0
dot (x : xs) (y : ys) = x * y + dot xs ys

-- Exercise 12
numbers xs =
  numbersAux xs 0
  where
    numbersAux [] acc = acc
    numbersAux (x : xs) acc = numbersAux xs (10*acc + x)
