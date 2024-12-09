fibsfrom n1 n2 = n1 : fibsfrom n2 (n1 + n2)

fibs n = take n (fibsfrom 1 1)