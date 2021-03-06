% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean_corpus.R
\name{clean_corpus}
\alias{clean_corpus}
\title{Clean a tidy data frame}
\usage{
clean_corpus(corpus, rm_special = FALSE, rm_numeric = FALSE)
}
\arguments{
\item{corpus}{A data frame containing a column named text}

\item{rm_special}{If TRUE, remove special (non-alphanumeric) characters}

\item{rm_numeric}{If TRUE, remove numeric characters}
}
\value{
A data frame containing the cleaned corpus
}
\description{
This is a function that cleans a tidy data frame representing
a corpus of documents
}
\examples{
library(janeaustenr)
corpus <- clean_corpus(austen_books())

}
