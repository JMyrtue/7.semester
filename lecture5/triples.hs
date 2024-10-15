triples :: [(a1, a2, a3)] -> ([a1], [a2], [a3])
triples [] = ([], [], [])
triples [(a, b, c)] = ([a], [b], [c])
triples ((x,y,z):xs) = (x:xs', y:ys', z:zs')
                    where 
                        (xs', ys', zs') = triples xs

-- triples (x : xs, y : ys, z : zs) = [[x], [y], [z]] : triples [(xs, ys, zs)]
