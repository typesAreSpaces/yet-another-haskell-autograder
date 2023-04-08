-- Exercise 1
stutter :: [a] -> [a]
stutter [] = []
stutter (x : xs) = x : (x : stutter xs)

-- Exercise 2
compress :: Eq a => [a] -> [a]
compress [] = []
compress (x : []) = x : []
compress (x : (y : ys)) = if x == y
  then (compress (y : ys))
  else x : (compress (y : ys))

-- Exercise 3
findIndicesAux :: Integer -> (a -> Bool) -> [a] -> [Integer]
findIndicesAux _ _ [] = []
findIndicesAux i pred (x : xs) =
  if (pred x)
  then i : findIndicesAux (i + 1) pred xs
  else findIndicesAux (i + 1) pred xs

findIndices = findIndicesAux 0

intersect :: Eq a => [a] -> [a] -> [a]
intersect xs ys = filter (\x -> elem x ys) xs

-- Exercise 4
isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf [] _ = True
isPrefixOf _ [] = False
isPrefixOf (x : xs) (y : ys) =
  if (x == y)
  then isPrefixOf xs ys
  else False

-- Exercise 5
isSuffixOf :: Eq a => [a] -> [a] -> Bool
isSuffixOf xs ys = isPrefixOf (reverse xs) (reverse ys)

-- Exercise 6
dot :: Num a => [a] -> [a] -> a
dot [] [] = 0
dot [] _ = 0
dot _ [] = 0
dot (x : xs) (y : ys) = x * y + dot xs ys

-- Exercise 7
increasing :: Ord a => [a] -> Bool
increasing [] = True
increasing (x : []) = True
increasing (x : (y : ys)) =
  if (x < y) then increasing (y : ys)
  else False

-- Exercise 8
decimate :: [a] -> [a]
decimate xs = if (length xs < 10)
  then xs
  else (take 9 xs) ++ decimate (drop 10 xs)

-- Exercise 9
 
-- encipherAux [] _ _ = error "Dictionary is incomplete"
-- encipherAux _ [] _ = error "Dictionary is incomplete"
encipherAux [] _ c = c
encipherAux _ [] c = c
encipherAux (x : xs) (y : ys) c =
  if (c == x)
  then y
  else encipherAux xs ys c

encipher xs ys zs = map (encipherAux xs ys) zs

-- Exercise 10
prefixSumAux [] acc _ = acc
prefixSumAux (x : xs) (acc) n = prefixSumAux xs (acc ++ [n + x]) (n + x)

prefixSum xs = prefixSumAux xs [] 0

-- Exercise 11
select pred [] _ = []
select pred _ [] = []
select pred (x : xs) (y : ys) =
  if (pred x) then y : select pred xs ys
  else select pred xs ys

-- Exercise 12
numbers xs =
  numbersAux xs 0
  where
    numbersAux [] acc = acc
    numbersAux (x : xs) acc = numbersAux xs (10*acc + x)
