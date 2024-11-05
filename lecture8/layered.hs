data Enc a = Entry String a [Enc a]

layered (Entry str []) = True
layered (Entry str xs) = all (>str) xs && map layered xs    