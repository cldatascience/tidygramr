library(testthat)
context("Create ngrams")

test_that("creating unigrams without stop words", {
  if (require("janeaustenr", quietly = TRUE)) {
    unigrams <- create_ngrams(austen_books(), "unigram")
    # Expect colunm names: book, ngram
    expect_equal(length(unigrams),2)
    # Expect 9160 rows after stop words are removed
    expect_equal(nrow(unigrams),725055)
  }
})

test_that("creating unigrams with stop words", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      unigrams <- create_ngrams(austen_books(), "unigram", stopwords=stop_words)
      # Expect column names: book, ngram
      expect_equal(length(unigrams),2)
      # Expect 9160 rows after stop words are removed
      expect_equal(nrow(unigrams),217609)
    }
  }
})

test_that("creating bigrams without stop words", {
  if (require("janeaustenr", quietly = TRUE)) {
    bigrams <- create_ngrams(austen_books(), "bigram")
    # Expect colunm names: book, ngram, word1, word2
    expect_equal(length(bigrams),4)
    # Expect 9160 rows after stop words are removed
    expect_equal(nrow(bigrams),725049)
  }
})

test_that("creating bigrams with stop words", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      bigrams <- create_ngrams(austen_books(), "bigram", stopwords=stop_words)
      # Expect column names: book, ngram, word1, word2
      expect_equal(length(bigrams),4)
      # Expect 9160 rows after stop words are removed
      expect_equal(nrow(bigrams),44784)
    }
  }
})

test_that("creating trigrams without stop words", {
  if (require("janeaustenr", quietly = TRUE)) {
    trigrams <- create_ngrams(austen_books(), "trigram")
    # Expect colunm names: book, ngram, word1, word2, word3
    expect_equal(length(trigrams),5)
    # Expect 9160 rows after stop words are removed
    expect_equal(nrow(trigrams),725043)
  }
})

test_that("creating trigrams with stop words", {
  if (require("janeaustenr", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      trigrams <- create_ngrams(austen_books(), "trigram", stopwords=stop_words)
      # Expect column names: book, ngram, word1, word2, word3
      expect_equal(length(trigrams),5)
      # Expect 9160 rows after stop words are removed
      expect_equal(nrow(trigrams),9160)
    }
  }
})
