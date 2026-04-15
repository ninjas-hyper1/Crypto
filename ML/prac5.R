#1 Required Packages
# Install and load necessary packages
install.packages("igraph")
install.packages("dagitty")
library(igraph)
library(dagitty)

# 2Creating DAG Using an Adjacency Matrix
# Define adjacency matrix (rows are sources, columns are targets)
adj_matrix <- matrix(c(
  0, 1, 1, 0, 0,
  0, 0, 0, 1, 0,
  0, 0, 0, 1, 0,
  0, 0, 0, 0, 1,
  0, 0, 0, 0, 0
), nrow=5, byrow=TRUE)

colnames(adj_matrix) <- rownames(adj_matrix) <- c("A", "B", "C", "D", "E")

# Convert matrix to graph
g <- graph_from_adjacency_matrix(adj_matrix, mode="directed")

# Plot DAG
plot(g, main="DAG from Matrix", vertex.size=30, vertex.label.cex=1.2)

#3 Convert Matrix to dagitty Object (Optional)
# Extract edges
edges <- get.edgelist(g)
edge_strings <- apply(edges, 1, function(x) paste(x[1], "->", x[2]))
dag_formula <- paste("dag {", paste(edge_strings, collapse=" "), "}")

# Create dagitty object
dag <- dagitty(dag_formula)
plot(dag)

#4 Finding Parents and Children of Nodes
# Find parents and children using dagitty
parents(dag, "D")

children(dag, "A")

#5 Conditional Independence from DAG
# Check conditional independencies
impliedConditionalIndependencies(dag)

# 6 Add and Remove Edges in Matrix
# Add edge from E -> B
adj_matrix["E", "B"] <- 1
g <- graph_from_adjacency_matrix(adj_matrix, mode="directed")
plot(g, main="DAG after Adding Edge E -> B")

# Remove edge from B -> D
adj_matrix["B", "D"] <- 0
g <- graph_from_adjacency_matrix(adj_matrix, mode="directed")
plot(g, main="DAG after Removing Edge B -> D")
