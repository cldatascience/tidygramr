library(testthat)
context("Create dtm")

test_that("creating a document term matrix", {
  
  books <- data.frame(title = c("Book A", "Book B", "Book C"), 
                      text = c("Once upon a time", "A long time ago", 
                               "In a land far away"),
                      stringsAsFactors=FALSE)
  
  if(require("tm", quietly = TRUE)) {
    dtm <- create_dtm(books)
    
    # Expect 12 columns, for id and words
    expect_equal(length(dtm),12)
    
    # Expect 3 rows, one for each book
    expect_equal(nrow(dtm),3)
  }
})

test_that("creating a document term matrix with filterwords removed", {
  
  books <- data.frame(title = c("Book A", "Book B", "Book C"), 
                      text = c("Once upon a time", "A long time ago", 
                               "In a land far away"),
                      stringsAsFactors=FALSE)
  
  if(require("tm", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      dtm <- create_dtm(books, filterwords=stop_words)
      
      # Expect 5 columns, for id and words
      expect_equal(length(dtm),5)
      
      # Expect 3 rows, one for each book
      expect_equal(nrow(dtm),3)
    }}
})

test_that("creating a document term matrix with selected features", {
  
  books <- data.frame(title = c("Book A", "Book B", "Book C"), 
                      text = c("Once upon a time", "A long time ago", 
                               "In a land far away"),
                      stringsAsFactors=FALSE)
  
  features <- data.frame(word = c("once","far","away"))
  
  if(require("tm", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      dtm <- create_dtm(books, filterwords=features, stop=FALSE)
      
      # Expect 5 columns, for id and words
      expect_equal(length(dtm),5)
      
      # Expect 3 rows, one for each book
      expect_equal(nrow(dtm),3)
    }}
})

test_that("creating a document term matrix with another book title", {
  books <- data.frame(book = c("Book A", "Book B", "Book C"), 
                      text = c("Once upon a time", "A long time ago", 
                               "In a land far away"),
                      stringsAsFactors=FALSE)
  
  if(require("tm", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      dtm <- create_dtm(books, doc_title="book", filterwords=stop_words)
      
      # Expect 5 columns for id and words
      expect_equal(length(dtm),5)
      
      # Expect 3 rows, one for each book
      expect_equal(nrow(dtm),3)
    }
  }
})

test_that("creating a document term matrix with book title, no filterwords", {
  books <- data.frame(book = c("Book A", "Book B", "Book C"), 
                      text = c("Once upon a time", "A long time ago", 
                               "In a land far away"),
                      stringsAsFactors=FALSE)
  
  if(require("tm", quietly = TRUE)) {
    if(require("tidytext", quietly = TRUE)) {
      dtm <- create_dtm(books, doc_title="book")
      
      # Expect 11 columns, for id and words
      expect_equal(length(dtm),12)
      
      # Expect 3 rows, one for each book
      expect_equal(nrow(dtm),3)
    }
  }
})