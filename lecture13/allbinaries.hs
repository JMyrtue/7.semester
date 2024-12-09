allBinaries = let next x = x : next (countUp x) in next "0"
    where
        countUp ['0'] = "1"
        countUp ['1'] = "01"
        countUp ('1':bs) = '0': countUp bs
        countUp ('0':bs) = '1': bs


-- Solution by lecturer:
-- The solution entails building all binaries, using helper functions, and then sorting our all binary strings which ends on zeros.
