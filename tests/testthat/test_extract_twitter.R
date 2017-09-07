library(testthat)
context("Extract twitter data")

test_that("extract hashtag unigrams", {
  test_df <- read.csv("../testdata/test_docs.csv",stringsAsFactors = FALSE)
  
  hashtags <- extract_twitter(test_df)
  hashtag_freq <- count_ngrams(hashtags)
  expect_match(hashtag_freq$ngram[1],"#hellotwitter")

  # Expect 3 unique hashtags rather than 6 
  # (the case if hashtags without words were allowed)
  expect_equal(nrow(hashtag_freq),3)
})

test_that("extract handle unigrams", {
  test_df <- read.csv("../testdata/test_docs.csv",stringsAsFactors = FALSE)
  
  handles <- extract_twitter(test_df,tag="handle")
  handle_freq <- count_ngrams(handles)
  expect_match(handle_freq$ngram[1],"@myhandle")
})