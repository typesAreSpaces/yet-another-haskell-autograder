module Color (module Color) where

-- colored printing enabled
coloredPrint :: Bool
coloredPrint = False

-- colored printing functionality
data Color = Normal | Red | Green

codeFor :: Color -> Int
codeFor Normal = 0
codeFor Red    = 31
codeFor Green  = 32

stringFor :: Color -> String
stringFor color = "\x1b[" ++ show (codeFor color) ++ "m"

paint :: Color -> String -> String
paint color string
    | coloredPrint = stringFor color ++ string ++ stringFor Normal
    | otherwise = string

resultColor :: Int -> Int -> Color
resultColor scored total
    | total < 2*scored = Green
    | otherwise = Red
