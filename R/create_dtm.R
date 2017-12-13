#' Create a document-term matrix
#'
#' A function to create a document-term matrix from a corpus
#' It is a convenience function based around tidytext::cast_dtm
#' The format of the returned data frame is intended to be suitable as 
#' input to machine learning tasks
#'
#' @param corpus A data frame containing columns for title and text
#' @param filterwords A data frame containing words to filter on
#' @param stop A boolean denoting whether to use filterwords as top words
#' @param doc_title The column name containing document title
#'
#' @return A data frame of a document term matrix.
#'
#' @examples
#' \dontrun{
#' library(tidytext)
#' books <- data.frame(title = c("Book A", "Book B", "Book C"), 
#'                     text = c("Once upon a time", "A long time ago", 
#'                     "In a land far away"),
#'                     stringsAsFactors=FALSE)
#' book_dtm <- create_dtm(books)
#' book_dtm_1 <- create_dtm(books,filterwords=stop_words)
#' }
#'
#' @import dplyr
#' @import tidytext
#'
#' @export
create_dtm <- function(corpus, filterwords, 
                       stop=TRUE, doc_title="title"){
  word <- text <- title <- dtm <- NULL
  
  corpus <- dplyr::rename_(corpus, title=doc_title)
  ngrams <- tidytext::unnest_tokens(corpus, word, text)
  
  if (!missing(filterwords)){
    if(stop==TRUE){
      ngrams <- dplyr::filter(ngrams, !word %in% filterwords$word)
    } else {
      ngrams <- dplyr::filter(ngrams, word %in% filterwords$word)
    }
  }
  
  ngram_counts <- dplyr::count(ngrams, title, word)
  dtm <- tidytext::cast_dtm(ngram_counts, title, word, n)
  data_dtm <- as.data.frame(as.matrix(dtm))
  data_dtm <- cbind(title=rownames(data_dtm), data.frame(data_dtm, row.names=NULL))
  data_dtm$title <- as.character(data_dtm$title)
  corpus$title <- as.character(corpus$title)
  data_dtm <- left_join(corpus,data_dtm,by="title")
  data_dtm[is.na(data_dtm)] <- 0
  data_dtm$title <- as.character(data_dtm$title)
  
  return(data_dtm)
}
