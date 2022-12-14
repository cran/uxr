% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compare_means_within_groups.R
\name{compare_means_within_groups}
\alias{compare_means_within_groups}
\title{Compare Means Within Groups}
\usage{
compare_means_within_groups(
  data,
  var1,
  var2,
  input = "wide",
  output = "console"
)
}
\arguments{
\item{data}{dataframe}

\item{var1}{variable 1}

\item{var2}{variable 2}

\item{input}{Default: "long" - long form of data, "values" to pass values directly. If using this option, must specify mean, sd, and n.}

\item{output}{Default: "console" - prints output in console and returns tibble invisibly.}
}
\value{
results
}
\description{
Compare Means Within Groups
}
\examples{
data <- data.frame(id = c(1:7),
  task1 = c(4, 1, 2, 3, 8, 4, 4),
  task2 = c(7, 13, 9, 7, 18, 8, 10))
compare_means_within_groups(data, task1, task2)
}
