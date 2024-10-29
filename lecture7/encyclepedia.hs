data Ency a = Node String a [Ency a]
            deriving Show

test = Node("hej" 4)



-- Student solution:
-- data Encyclopedia a =  Node a [Encyclopedia a] deriving Show

-- t1 = Node("mango",True)
--     [
--         Node("dingo", False)
--             [Node("plip", True)[],
--             Node("ninka",False)[]],
--         Node("plop",True)[],
--         Node("plys", False)
--             [Node("boing",True)[]]
--     ]

-- t2 = Node("plonk", 1)
--     [
--         Node("zap",3)
--             [Node("ninka",8)[]],
--         Node("uhu",4)
--             [Node("gif",9)[]],
--         Node("ningo",5)[]
--     ]