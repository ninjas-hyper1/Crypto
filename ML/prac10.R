# Step 1: Install and load the required package.
install.packages("igraph")
library(igraph)

# Step 2: Create a Random Graph.
g <- erdos.renyi.game(n = 10, p = 0.3, directed = TRUE)
plot(g)

# Step 3: Calculate PageRank.
pr <- page.rank(g)$vector
print(pr)

# Step 4: Visualize the Graph with PageRank Scores.
plot(g, vertex.size = pr * 50, vertex.label = round(pr, 2))

