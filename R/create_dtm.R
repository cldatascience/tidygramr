#' Create a document-term matrix
#'
#' A function to create a document-term matrix from a corpus
#' It is a convenience function based around tidytext::cast_dtm
#' The format of the returned data frame is intended to be suitable as 
#' input to machine learning tasks
#'
#' @param corpus A data frame containing columns for title and text
#' @param doc_title The column name containing document title
#' @param stopwords A data frame containing stop words
#'
#' @return A data frame of a document term matrix.
#'
#' @examples
#' \dontrun{
#' library(janeaustenr)
#' library(tidytext)
#' books <- data.frame(title = c("Book A", "Book B", "Book C"), 
#'                     text = c("Once upon a time", "A long time ago", "In a land far away"),
#'                     stringsAsFactors=FALSE)
#' book_dtm <- create_dtm(books)
#' book_dtm_1 <- create_dtm(books,stopwords=stop_words)
#' }
#'
#' @import dplyr
#' @importFrom tidytext cast_dtm unnest_tokens
#'
#' @export
create_dtm <- function(corpus, stopwords, doc_title="title"){
  word <- text <- title <- dtm <- NULL
  
  corpus <- dplyr::rename_(corpus, title=doc_title)
  ngrams <- tidytext::unnest_tokens(corpus, word, text)
  id <- corpus$title
  
  if (!missing(stopwords)){
    ngrams <- dplyr::filter(ngrams, !word %in% stopwords$word)
  }
  
  ngram_counts <- dplyr::count(ngrams, title, word)
  dtm <- tidytext::cast_dtm(ngram_counts, title, word, n)
  data_dtm <- as.data.frame(as.matrix(dtm))
  data_dtm <- cbind(id,data_dtm,row.names=NULL)
  data_dtm$id <- as.character(data_dtm$id)
  
  return(data_dtm)
}
