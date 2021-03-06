% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/play.R
\name{run_validation_tests.default}
\alias{run_validation_tests.default}
\title{Run Validation Tests on Variable}
\usage{
\method{run_validation_tests}{default}(x, parameters, ...)
}
\arguments{
\item{x}{anything.}

\item{parameters}{\code{list} statistics and meta data of the same variable
recorded from training data (with \code{\link{record}}).}

\item{...}{further arguments passed to or from other methods. Not used at
the moment.}
}
\value{
\code{list} results from validation tests.
}
\description{
Runs a set of validation tests on variable in new data. These tests
are based on statistics and meta data of the same variable recorded 
(with \code{\link{record}}) from the training data.
}
