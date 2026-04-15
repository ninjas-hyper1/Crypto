# Install and load required packages
install.packages("gRain")
install.packages("gRbase")
install.packages("bnlearn")

library(gRain)
library(gRbase)
library(bnlearn)

#1 Define Conditional Probability Tables (CPTs)
# Asia node
Asia <- cptable(~Asia, values=c(0.99, 0.01), levels=c("no", "yes"))

# Smoking node
Smoke <- cptable(~Smoke, values=c(0.5, 0.5), levels=c("no", "yes"))

# Tuberculosis conditional on Asia
Tub <- cptable(~Tub|Asia, values=c(0.99, 0.01, 0.95, 0.05), levels=c("no", "yes"))

# Lung Cancer conditional on Smoking
Lung <- cptable(~Lung|Smoke, values=c(0.99, 0.01, 0.9, 0.1), levels=c("no", "yes"))

# Bronchitis conditional on Smoking
Bron <- cptable(~Bron|Smoke, values=c(0.7, 0.3, 0.4, 0.6), levels=c("no", "yes"))

# Either (Lung OR Tuberculosis)
Either <- cptable(~Either|Lung:Tub, values=c(1,0,0,1,0,1,0,1), levels=c("no", "yes"))

# X-ray result conditional on Either
Xray <- cptable(~Xray|Either, values=c(0.9, 0.1, 0.2, 0.8), levels=c("no", "yes"))

# Dyspnoea conditional on Bronchitis and Either
Dysp <- cptable(~Dysp|Bron:Either, values=c(0.9,0.1,0.7,0.3,0.8,0.2,0.1,0.9), levels=c("no", "yes"))


# 2 Compile the Bayesian Network
# Compile CPTs
plist <- compileCPT(list(Asia, Smoke, Tub, Lung, Bron, Either, Xray, Dysp))

# Create the Bayesian network
chest.bn <- grain(plist)
plot(chest.bn)

# 3 Set Findings (Evidence) and Query the Network
# Set evidence: patient visited Asia and has a positive X-ray
chest.ev <- setEvidence(chest.bn, nodes=c("Asia", "Xray"), states=c("yes", "yes"))

# Query marginal probabilities
querygrain(chest.ev, nodes=c("Tub", "Lung", "Bron", "Dysp"), type="marginal")

#4 Ask Specific Queries
# What is the probability of Tuberculosis given Asia = yes and Xray = yes?
querygrain(chest.ev, nodes="Tub", type="marginal")

# What is the probability of Dyspnoea?
querygrain(chest.ev, nodes="Dysp", type="marginal")

