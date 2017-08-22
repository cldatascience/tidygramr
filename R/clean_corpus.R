#' Clean a tidy data frame
#'
#' This is a function that cleans a tidy data frame representing
#' a corpus of documents
#'
#' @param corpus A data frame containing a column named text
#' @param rm_special If TRUE, remove special (non-alphanumeric) characters
#' @param rm_numeric If TRUE, remove numeric characters
#'
#' @return A data frame containing the cleaned corpus
#'
#' @examples
#' library(janeaustenr)
#' corpus <- clean_corpus(austen_books())
#'
#'@importFrom dplyr mutate
#'
#' @export
clean_corpus <- function(corpus, rm_special = FALSE, rm_numeric = FALSE){
  text <- NULL

  corpus <- dplyr::mutate(corpus, text = iconv(text, "ASCII", "UTF-8", sub=""))

  if(rm_special==TRUE){
    corpus <- dplyr::mutate(corpus, text = gsub("[^[:alnum:] ]", "", text))
  }

  if(rm_numeric==TRUE){
    corpus <- dplyr::mutate(corpus, text = gsub("[0-9]", "", text))
  }

  return(corpus)
}
