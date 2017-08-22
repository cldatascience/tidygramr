#' Create ngram frequencies
#'
#' A function to create frequency counts for an n-gram model
#'
#' @param ngram_model A data frame containing an n-gram model
#' @param by_book If TRUE, calculate n-gram frequencies by book
#' @param doc_title The column name containing document title
#'
#' @return A data frame of n-grams with frequency counts
#'
#' @examples
#' library(janeaustenr)
#' library(tidytext)
#' bigrams <- create_ngrams(austen_books(),"bigram",stopwords=stop_words)
#' bigram_freqs <- count_ngrams(bigrams)
#'
#' @import dplyr
#'
#' @export
count_ngrams <- function(ngram_model, by_book=FALSE, doc_title="title"){
  title <- ngram <- NULL

  if(by_book==TRUE){
    ngram_model <- dplyr::rename_(ngram_model, title=doc_title)
    ngram_model <- dplyr::group_by(ngram_model, title)
    ngram_model <- dplyr::count(ngram_model, ngram, sort=TRUE)
    ngram_model <- dplyr::ungroup(ngram_model)
  } else {
    ngram_model <- dplyr::count(ngram_model, ngram, sort=TRUE)
  }

  return(ngram_model)
}
