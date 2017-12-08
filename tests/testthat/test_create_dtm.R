library(testthat)
context("Create dtm")

books <- data.frame(title = c("Book A", "Book B", "Book C"), 
                    text = c("Once upon a time", "A long time ago", 
                             "In a land far away"),
                    stringsAsFactors=FALSE)

books_1 <- data.frame(book = c("Book A", "Book B", "Book C"), 
                    text = c("Once upon a time", "A long time ago", 
                             "In a land far away"),
                    stringsAsFactors=FALSE)

test_that("creating a document term matrix", {
    dtm <- create_dtm(books)
    
    # Expect 11 columns, 1 for id and 10 others representing words
    expect_equal(length(dtm),11)
    
    # Expect 3 rows, one for each book
    expect_equal(nrow(dtm),3)
})

test_that("creating a document term matrix with stopwords removed", {
  if(require("tidytext", quietly = TRUE)) {
  dtm <- create_dtm(books, stopwords=stop_words)
  
  # Expect 11 columns, 1 for id and 3 others representing remaining words
  expect_equal(length(dtm),4)
  
  # Expect 3 rows, one for each book
  expect_equal(nrow(dtm),3)
  }
})

test_that("creating a document term matrix with another book title", {
  if(require("tidytext", quietly = TRUE)) {
    dtm <- create_dtm(books_1, doc_title="book", stopwords=stop_words)
    
    # Expect 11 columns, 1 for id and 3 others representing remaining words
    expect_equal(length(dtm),4)
    
    # Expect 3 rows, one for each book
    expect_equal(nrow(dtm),3)
  }
})