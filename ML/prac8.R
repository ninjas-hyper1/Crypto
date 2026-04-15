# 1 required packages
install.packages("stringdist")
library(stringdist)

# 2 Define the Two Amino Acid Sequences
seq1 <- "ACDEFGHIKLMNPQRSTVWY"
seq2 <- "CDEFGHIKLMNPQRSVWYAC"

# 3 Create a Function to Count Common Substrings.
get_substrings <- function(seq, k) {
  substrings <- c()
  for (i in 1:(nchar(seq) - k + 1)) {
    substrings <- c(substrings, substr(seq, i, i + k - 1))
  }
  return(substrings)
}

string_kernel_similarity <- function(seq1, seq2, k) {
  substrings1 <- get_substrings(seq1, k)
  substrings2 <- get_substrings(seq2, k)
  common_subs <- intersect(substrings1, substrings2)
  return(length(common_subs))
}

#4 Calculate Similarity
k <- 3  # choose k-mer length
similarity_score <- string_kernel_similarity(seq1, seq2, k)
print(similarity_score)

