import Data.Char

nim :: IO ()
nim = play initial 1

play :: Board -> Int -> IO ()
play board player =
    do newline
       putBoard board
       if finished board then
           do newline
              putStr "Player "
              putStr (show (next player))
              putStrLn " wins!!"
       else
           do newline
              putStr "Player "
              putStrLn (show player)
              row <- getDigit "Enter a row number: "
              num <- getDigit "Stars to remove : "
              if valid board row num then
                  play (move board row num) (next player)
              else
                  do newline   
                     putStrLn "ERROR: Invalid move"
                     play board player

type Board = [Int]

next :: Int -> Int
next 1 = 2
next 2 = 1  

initial :: Board
initial = [5, 4, 3, 2, 1]

finished :: Board -> Bool
finished b = all (==0) b

-- putBoard :: Board -> IO ()
putBoard b = [print r | r <- b]
        where print r = putStrLn (concat (replicate r "* "))

newline :: IO ()
newline = putChar '\n'

valid :: Board -> Int -> Int -> Bool
valid b r n = b !! r >= n

move :: Board -> Int -> Int -> Board
move b row num = [update r n | (r,n) <- zip [1..] b]
    where update r n = if r == row then n - num else n

getDigit :: String -> IO Int
getDigit prompt = do putStr prompt
                     x <- getChar
                     newline
                     if isDigit x then
                        return (digitToInt x)
                     else
                        do putStrLn "Provide a number"
                           getDigit prompt