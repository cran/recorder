## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ------------------------------------------------------------------------
set.seed(1)
trn_idx <- sample(seq_len(nrow(iris)), 100)
data_training <- iris[trn_idx, ]
data_new <- iris[-trn_idx, ]

## ------------------------------------------------------------------------
library(recorder)
tape <- record(data_training)

## ------------------------------------------------------------------------
str(tape)

## ------------------------------------------------------------------------
# create sample of row indices.
samples <- lapply(1:3, function(x) {
  set.seed(x) 
  sample(nrow(data_new), 5, replace = FALSE)})

# create numeric values without range, -Inf and Inf.
data_new$Sepal.Width[samples[[1]]] <- -Inf
data_new$Petal.Width[samples[[2]]] <- Inf

# insert NA's in numeric vector.
data_new$Petal.Length[samples[[3]]] <- NA_real_

# insert new column.
data_new$junk <- "junk"

## ------------------------------------------------------------------------
get_tests_meta_data()

## ------------------------------------------------------------------------
playback <- play(tape, data_new)

## ------------------------------------------------------------------------
class(playback)

## ------------------------------------------------------------------------
playback

## ------------------------------------------------------------------------
knitr::kable(head(get_failed_tests(playback), 15))

## ------------------------------------------------------------------------
head(get_failed_tests_string(playback))

## ------------------------------------------------------------------------
get_clean_rows(playback)

## ------------------------------------------------------------------------
get_clean_rows(playback, ignore_tests = "new_variable")

## ------------------------------------------------------------------------
get_clean_rows(playback, 
               ignore_tests = "new_variable",
               ignore_cols = "Petal.Length")

## ------------------------------------------------------------------------
knitr::kable(head(get_failed_tests(playback, 
                                   ignore_tests = "new_variable",
                                   ignore_cols = "Petal.Length",
                                   ignore_combinations = list(outside_range = "Sepal.Width")),
                  15))

