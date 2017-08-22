library(testthat)
context("Create tf-idf")

test_that("create unigram tfidf for the corpus", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      unigrams <- create_ngrams(austen_books(), "unigram", stopwords=stop_words)
      unigram_freqs <- create_tfidf(unigrams,doc_title="book")

      # Expect colunm names: title, ngram, n, tf, idf, tf_idf
      expect_equal(length(unigram_freqs),6)
    }
  }
})

test_that("create bigram tfidf for the corpus", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      bigrams <- create_ngrams(austen_books(), "bigram", stopwords=stop_words)
      bigrams_freqs <- create_tfidf(bigrams,doc_title="book")

      # Expect colunm names: title, ngram, n, tf, idf, tf_idf
      expect_equal(length(bigrams_freqs),6)
    }
  }
})

test_that("create trigram tfidf for the corpus", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      trigrams <- create_ngrams(austen_books(), "trigram", stopwords=stop_words)
      trigrams_freqs <- create_tfidf(trigrams,doc_title="book")

      # Expect colunm names: title, ngram, n, tf, idf, tf_idf
      expect_equal(length(trigrams_freqs),6)
    }
  }
})
