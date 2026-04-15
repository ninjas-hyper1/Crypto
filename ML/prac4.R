# Install and load required packages
install.packages("dagitty")
library(dagitty)

# 1 Creating DAG Using Vectors
# Define nodes and edges using vectors
nodes <- c("A", "B", "C", "D", "E")
edges <- c("A -> B", "A -> C", "B -> D", "C -> D", "D -> E")

# Create DAG string from edges
dag_formula <- paste("dag {", paste(edges, collapse=" "), "}")

# Create DAG using dagitty
dag <- dagitty(dag_formula)
plot(dag)

# 2 Finding Parents and Children of Nodes
# Find parents
parents(dag, "D")

# Find children
children(dag, "A")

#3 Reading Conditional Independence
# Implied conditional independencies in DAG
impliedConditionalIndependencies(dag)

# 4 Adding and Removing Edges
# Adding a new edge E -> B
edges <- c(edges, "E -> B")
dag_formula <- paste("dag {", paste(edges, collapse=" "), "}")
dag <- dagitty(dag_formula)
plot(dag)

# Removing an edge B -> D
edges <- edges[edges != "B -> D"]
dag_formula <- paste("dag {", paste(edges, collapse=" "), "}")
dag <- dagitty(dag_formula)
plot(dag)

