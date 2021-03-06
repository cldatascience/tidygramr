% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_twitter.R
\name{extract_twitter}
\alias{extract_twitter}
\title{Extract hashtag unigrams from tidy Twitter data}
\usage{
extract_twitter(corpus, tag = "hashtag")
}
\arguments{
\item{corpus}{A data frame containing columns for title and text}

\item{tag}{A data frame containing stop words, expect "hashtag" 
or "handle"}
}
\value{
A data frame containing Twitter hashtags or handles
}
\description{
A function to create a unigram model of hashtags/handles from 
a tidy data frame of Twitter data, and is a convenience function based
around tidytext functions
}
\examples{
\dontrun{
tweets <- read.csv("tweets.csv", header=FALSE)
hashtags <- extract_hashtags(tweets)
handles <- extract_hashtags(tweets,tag="handle")
}

}
