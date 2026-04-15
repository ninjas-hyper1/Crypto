# Install and load necessary package
install.packages("dagitty")
library(dagitty)

# Define a DAG using dagitty package
dag <- dagitty("dag {
  X -> Y
  Z -> X
  Z -> Y
  Y -> W
}")
plot(dag)

#. Finding Parents and Children of Nodes

# Find parents of a node
parents(dag, "Y")

# Find children of a node
children(dag, "Z")

# Reading Conditional Independence
# Check for conditional independencies implied by DAG
impliedConditionalIndependencies(dag)

# Adding and Removing Edges
# Add an edge: W -> Z
dag <- dagitty("dag {
  X -> Y
  Z -> X
  Z -> Y
  Y -> W
  W -> Z
}")
plot(dag)

# Remove an edge: Y -> W removed by redefining DAG
dag <- dagitty("dag {
  X -> Y
  Z -> X
  Z -> Y
}")
plot(dag)
