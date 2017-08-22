library(testthat)
context("Cleaning a corpus")

test_that("test remove non-alphanumeric strings", {
  test_df <- read.csv("../testdata/test_docs.csv",stringsAsFactors = FALSE)

  # Test that non-alphanumeric strings are removed
  clean_df <- clean_corpus(test_df, rm_special=TRUE)
  expect_match(clean_df$text[1],
               "Some sample text arranged into sentences Some other text 1234")
  expect_match(clean_df$text[2],
               "Some sample text arranged into sentences Some other text 1234")
})

test_that("test remove numeric strings", {
  test_df <- read.csv("../testdata/test_docs.csv",stringsAsFactors = FALSE)

  # Test that only numeric strings are removed
  clean_df <- clean_corpus(test_df, rm_numeric=TRUE)
  expect_match(clean_df$text[1],
               "Some sample text, arranged into sentences. Some other text .")
  expect_match(clean_df$text[2],
               "Some sample text, arranged into sentences. Some other text .")

})
