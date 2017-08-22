#' Create ngrams from tidy data
#'
#' A function to create an n-gram model from a tidy data frame.
#' It is a convenience function based around tidytext functions
#'
#' @param corpus A data frame containing columns for title and text
#' @param ngram_size An character string denoting the size of n-gram
#' (unigram, bigram or trigram)
#' @param stopwords A data frame containing stop words
#'
#' @return A data frame of ngrams
#'
#' @importFrom dplyr filter
#' @importFrom tidytext unnest_tokens
#' @importFrom tidyr separate
#' @export
#'
#' @examples
#' library(janeaustenr)
#' library(tidytext)
#' unigrams <- create_ngrams(austen_books(),"unigram")
#' stopped <- create_ngrams(austen_books(),"unigram",stopwords=stop_words)
#'
#'
#' @export
create_ngrams <- function(corpus,ngram_size,stopwords){
  ngram <- text <- word1 <- word2 <- word3 <- NULL

  if (ngram_size=="unigram"){
    if (!missing(stopwords)){
      ngrams <- tidytext::unnest_tokens(corpus,ngram,text,token="ngrams", n=1)
      ngrams <- dplyr::filter(ngrams, !ngram %in% stopwords$word)
    } else {
      ngrams <- tidytext::unnest_tokens(corpus,ngram,text,token="ngrams",n=1)
    }
  } else if (ngram_size=="bigram"){
    if(!missing(stopwords)){
      ngrams <- tidytext::unnest_tokens(corpus,ngram,text,token="ngrams",n=2)
      ngrams <- tidyr::separate(ngrams, ngram,c("word1", "word2"),sep=" ",remove=FALSE)
      ngrams <- dplyr::filter(ngrams, !word1 %in% stopwords$word,
                              !word2 %in% stopwords$word)
    } else {
      ngrams <- tidytext::unnest_tokens(corpus,ngram,text,token="ngrams",n=2)
      ngrams <- tidyr::separate(ngrams,ngram,c("word1", "word2"),sep=" ",remove=FALSE)
    }
  } else if(ngram_size=="trigram"){
    if(!missing(stopwords)){
      ngrams <- tidytext::unnest_tokens(corpus,ngram,text,token="ngrams",n=3)
      ngrams <- tidyr::separate(ngrams,ngram,c("word1", "word2", "word3"),
                                sep = " ",remove=FALSE)
      ngrams <- dplyr::filter(ngrams,!word1 %in% stopwords$word,
                              !word2 %in% stopwords$word,
                              !word3 %in% stopwords$word)
    } else {
      ngrams <- tidytext::unnest_tokens(corpus,ngram,text,token="ngrams",n=3)
      ngrams <- tidyr::separate(ngrams,ngram, c("word1", "word2", "word3"),
                                sep = " ",remove=FALSE)
    }
  } else {
    stop('Please provide a corpus and the size of the n-gram model:
         unigram, bigram or trigram')
  }
  return(ngrams)
}
