# library(testthat)
# context("Count n-gram frequencies")
#
test_that("count unigram frequencies for the corpus", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      unigrams <- create_ngrams(austen_books(), "unigram", stopwords=stop_words)
      unigram_freqs <- count_ngrams(unigrams,doc_title="book")

      # Expect colunm names: ngram, n
      expect_equal(length(unigram_freqs),2)
    }
  }
})

test_that("count unigram frequencies for the corpus, by book", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      unigrams <- create_ngrams(austen_books(), "unigram", stopwords=stop_words)
      unigram_freqs <- count_ngrams(unigrams,by_book=TRUE,doc_title="book")

      # Expect colunm names: book, ngram, n
      expect_equal(length(unigram_freqs),3)
    }
  }
})

test_that("count bigram frequencies for the corpus", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      bigrams <- create_ngrams(austen_books(), "bigram", stopwords=stop_words)
      bigram_freqs <- count_ngrams(bigrams,doc_title="book")

      # Expect colunm names: ngram, n
      expect_equal(length(bigram_freqs),2)
    }
  }
})

test_that("count bigram frequencies for the corpus, by book", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      bigrams <- create_ngrams(austen_books(), "bigram", stopwords=stop_words)
      bigram_freqs <- count_ngrams(bigrams,by_book=TRUE,doc_title="book")

      # Expect colunm names: book, ngram, n
      expect_equal(length(bigram_freqs),3)
    }
  }
})

test_that("count trigram frequencies for the corpus", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      trigrams <- create_ngrams(austen_books(), "trigram", stopwords=stop_words)
      trigram_freqs <- count_ngrams(trigrams,doc_title="book")

      # Expect colunm names: ngram, n
      expect_equal(length(trigram_freqs),2)

      # Most common trigram correctly obtained
      expect_match(trigram_freqs$ngram[1],"dear miss woodhouse")
      expect_equal(trigram_freqs$n[1],23)
    }
  }
})

test_that("count trigram frequencies for the corpus, by book", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      trigrams <- create_ngrams(austen_books(), "trigram", stopwords=stop_words)
      trigram_freqs <- count_ngrams(trigrams,by_book=TRUE,doc_title="book")

      # Expect colunm names: book, ngram, n
      expect_equal(length(trigram_freqs),3)
    }
  }
})
