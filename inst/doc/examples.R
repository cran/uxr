## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(uxr)

## -----------------------------------------------------------------------------
data <- data.frame(task_1 = c("y", "y", "y", "y", "n", "n", "n", NA, NA, NA, NA, NA, NA, NA),
                    task_2 = c(0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1))

## with dataframe column

benchmark_event(data, 
                column = task_1, 
                benchmark = 0.8, 
                event = "y")

## -----------------------------------------------------------------------------
benchmark_event(data, 
                column = task_2, 
                benchmark = 0.3, 
                event = 1, 
                event_type = "success")

## -----------------------------------------------------------------------------
## pipeable
data |> 
  benchmark_event(column = task_2, 
                  benchmark = 0.3, 
                  event = 1, 
                  event_type = "success")

## -----------------------------------------------------------------------------
# specify `input = "values` to use with direct values
benchmark_event(benchmark = 0.8, 
                count = 9, 
                total = 11, 
                input = "values")

## -----------------------------------------------------------------------------
# get confidence intervals
# test_wald_adj(10, 12)

## -----------------------------------------------------------------------------
scores <- 80 + 23 * scale(rnorm(172)) # 80 = mean, 23 = sd
data <- data.frame(scores = scores)

## -----------------------------------------------------------------------------
# with dataframe column
benchmark_score(data, scores, 67)

## -----------------------------------------------------------------------------
# pipeable
data |> benchmark_score(scores, 67)

## -----------------------------------------------------------------------------
# specify `input = "values` to use with direct values
benchmark_score(mean = 80, 
                sd = 23, 
                n = 172, 
                benchmark = 67, 
                input = "values")

## -----------------------------------------------------------------------------
data <- data.frame(time = c(60, 53, 70, 42, 62, 43, 81))
benchmark_time(data, column = time, benchmark = 60, alpha = 0.05)

## -----------------------------------------------------------------------------
# Wide data - default

data_wide <- data.frame(A = c(4, 2, 5, 3, 6, 2, 5),
                        B = c(5, 2, 1, 2, 1, 3, 2))

compare_means_between_groups(data_wide, var1 = A, var2 = B)

## -----------------------------------------------------------------------------
# Long data

data_long <- data_wide |> tibble::rowid_to_column("id") |>
  tidyr::pivot_longer(cols = -id, names_to = "group", values_to = "variable")

compare_means_between_groups(data_long, 
                             variable = variable,
                             grouping_variable = group, 
                             groups = c("A", "B"), 
                             input = "long")

## -----------------------------------------------------------------------------
A <- 51.6 + 4.07 * scale(rnorm(11)) 
A <- c(A, NA)
B <- 49.6 + 4.63 * scale(rnorm(12))
data <- data.frame(A, B)

compare_means_between_groups(data, A, B)

## -----------------------------------------------------------------------------
data <- data.frame(id = c(1:7), task1 = c(4, 1, 2, 3, 8, 4, 4), task2 = c(7, 13, 9, 7, 18, 8, 10))
compare_means_within_groups(data, task1, task2)

## -----------------------------------------------------------------------------
design = c("A","B")
complete = c(10, 4)
incomplete = c(2, 9)
data <- data.frame(design, complete, incomplete)
data <- data |> tidyr::pivot_longer(!design, names_to = "rate", values_to = "n") |>
  tidyr::uncount(n)

compare_rates_between_groups(data, group = design, event = rate)


## -----------------------------------------------------------------------------
A <- c(1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1)
B <- c(0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0)
data <- data.frame(A, B)

compare_rates_within_groups(data, A, B, input = "wide")

