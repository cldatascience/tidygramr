#' Calculate tf-idf
#'
#' A function to calculate tf-idf for an n-gram ngram_model (stop words not removed).
#' It is a convenience function based around tidytext::bind_tf_idf
#'
#' @param ngram_model A data frame containing an n-gram ngram_model
#' @param doc_title The column name containing document title
#'
#' @return A data frame of n-grams with tf-idf information.
#'
#' @examples
#' library(janeaustenr)
#' library(tidytext)
#' bigrams <- create_ngrams(austen_books(),"bigram",stopwords=stop_words)
#' bigram_tfidf <- create_tfidf(bigrams,doc_title="book")
#'
#' @import dplyr
#' @importFrom tidytext bind_tf_idf
#'
#' @export
create_tfidf <- function(ngram_model, doc_title="title"){
  title <- ngram <- tf_idf <- NULL

  ngram_model <- dplyr::rename_(ngram_model, title=doc_title)
  ngram_model <- dplyr::count(ngram_model, title, ngram, sort=TRUE)
  ngram_model <- tidytext::bind_tf_idf(ngram_model, ngram, title, n)
  ngram_model <- dplyr::arrange(ngram_model,desc(tf_idf))

  return(ngram_model)
}
