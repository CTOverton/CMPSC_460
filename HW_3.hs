type Node = Integer
type Edge = (Integer, Integer)
type Graph = [Edge]
type Path = [Node]
g::Graph
g = [(1,2),(1,3),(2,3),(2,4),(3,4)]
h::Graph
h = [(1,2),(1,3),(2,1),(3,2),(4,4)]

-- ----------------------------------------
-- [ Example 1 ]

tolist:: Graph -> [Node]
tolist [] = []
tolist (x:xs) = [fst x] ++ [snd x] ++ tolist xs

mem:: Node -> [Node] -> Bool
mem n [] = False
mem n (x:xs)
  | n == x = True
  | otherwise = mem n xs

removedup:: [Node] -> [Node]
removedup [] = []
removedup (x:xs)
  | mem x xs = removedup xs
  | otherwise = removedup xs++[x]

sort:: [Node] -> [Node]
sort [] = []
sort (x:xs) = sort smaller ++ [x] ++ sort larger
  where smaller = filter(<= x) xs
        larger = filter(> x) xs


nodes:: Graph -> [Node]
nodes graph = sort(removedup (tolist graph))

-- ----------------------------------------
-- [ Example 2 ]

adjacent:: Node -> Graph -> [Node]
adjacent node graph = [ snd x | x <- graph, fst x == node ]

-- ----------------------------------------
-- [ Example 3 ]

detach:: Node -> Graph -> Graph
detach node graph = [ x | x <- graph, fst x /= node, snd x /= node]

-- ----------------------------------------
-- [ Example 4 ]

paths:: Node -> Node -> Graph -> [Path]
paths v1 v2 graph
  | v1 == v2  = [[v1]]
  | otherwise = [ fst (v1,y):recur | y <- adjacent v1 graph, recur <- paths y v2 graph ]


main::IO()
main = do
print("-- [ Example 1 ]")
print(nodes g)

print("-- [ Example 2 ]")
print(adjacent 2 g)
print(adjacent 4 g)
print(adjacent 4 h)

print("-- [ Example 3 ]")
print(detach 3 g)

print("-- [ Example 4 ]")
print(paths 2 2 g)
print(paths 3 2 g)
print(paths 1 4 g)