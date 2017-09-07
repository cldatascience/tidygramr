#' Extract hashtag unigrams from tidy Twitter data
#'
#' A function to create a unigram model of hashtags/handles from 
#' a tidy data frame of Twitter data, and is a convenience function based
#' around tidytext functions
#'
#' @param corpus A data frame containing columns for title and text
#' @param tag A data frame containing stop words, expect "hashtag" 
#' or "handle"
#'
#' @return A data frame containing Twitter hashtags or handles
#'
#' @importFrom dplyr filter
#' @importFrom tidytext unnest_tokens
#'
#' @examples
#' \dontrun{
#' tweets <- read.csv("tweets.csv", header=FALSE)
#' hashtags <- extract_hashtags(tweets)
#' handles <- extract_hashtags(tweets,tag="handle")
#' }
#'
#' @export
extract_twitter <- function(corpus, tag="hashtag"){
  ngram <- text <- NULL

  unnest_reg <- "([^A-Za-z_\\d#@']|'(?![A-Za-z_\\d#@]))"

  ngrams <- tidytext::unnest_tokens(corpus, ngram, text, token = "regex",
                                    pattern = unnest_reg)
  
  if (tag=="hashtag") {
    ngrams <- dplyr::filter(ngrams, grepl("^#\\w",ngram))
  } else if (tag=="handle") {
    ngrams <- dplyr::filter(ngrams, grepl("^@\\w",ngram))
  } else {
    stop("extract_twitter expects value of tag to be `hashtag' or `handle'")
  }

  return(ngrams)
}
