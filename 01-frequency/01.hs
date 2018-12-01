import qualified Data.IntSet as Set
import Data.List
import Data.Maybe

main = do 
    inp <- fmap (map opMap . lines) $ readFile "input"
    putStrLn "Part A"
    print $ sum inp
    putStrLn "Part B"
    print $ (fromJust . firstDuplicate . freqMap . cycle) inp

opMap :: [Char] -> Int
opMap ('+':xs) = read xs
opMap xs = read xs

freqMap :: [Int] -> [Int]
freqMap xs = scanl1 (\x acc -> acc + x) xs

firstDuplicate :: [Int] -> Maybe Int
firstDuplicate xs = fd xs Set.empty
                where fd [] _ = Nothing
                      fd (t:ts) s = if Set.member t s
                        then Just t
                        else fd ts (Set.insert t s)

