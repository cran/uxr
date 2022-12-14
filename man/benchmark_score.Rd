% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/benchmark_score.R
\name{benchmark_score}
\alias{benchmark_score}
\title{Compare Score with a Benchmark}
\usage{
benchmark_score(
  data,
  column,
  benchmark,
  mean,
  sd,
  n,
  tail = "one",
  remove_missing = TRUE,
  input = "long",
  output = "console"
)
}
\arguments{
\item{data}{dataframe}

\item{column}{a column of scores from the dataframe}

\item{benchmark}{benchmark}

\item{mean}{if input = "values", enter mean value}

\item{sd}{if input = "values", enter standard deviation value}

\item{n}{if input = "values", enter total number of scores}

\item{tail}{one-tailed or two-tailed test}

\item{remove_missing}{TRUE/FALSE (Default is TRUE)}

\item{input}{Default: "long" - long form of data, "values" to pass values directly. If using this option, must specify mean, sd, and n.}

\item{output}{Default: "console" - prints output in console and returns tibble invisibly.}
}
\value{
dataframe of results when saved to an object. show console output by default
}
\description{
Compare Score with a Benchmark
}
\examples{
scores <- 80 + 23 * scale(rnorm(172)) # 80 = mean, 23 = sd
data <- data.frame(scores = scores)
benchmark_score(data, scores, 67)
data |> benchmark_score(scores, 67)
benchmark_score(mean = 80, sd = 23, n = 172, benchmark = 67, input = "values")
}
