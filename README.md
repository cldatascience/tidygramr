README
================

tidygramr
=========

`tidygramr` is a collection of utility functions based on the [tidytext](https://cran.r-project.org/package=tidytext) package. The goal of `tidygramr` is to clean text and to prepare tidy n-gram models.

**License:** [MIT](https://opensource.org/licenses/MIT)

Installation
------------

You can install `tidygramr` from github using [devtools](https://cran.r-project.org/package=devtools):

``` r
library(devtools)
install_github("cldatascience/tidygramr")
```

Examples
--------

Here are some basic examples outlining how to create n-gram models from Jane Austen's works (see [janeaustenr](https://cran.r-project.org/package=janeaustenr)). These examples replicate examples in the book [Tidy Text Mining with R](http://tidytextmining.com/ngrams.html), but make use of utility functions in `tidygramr` to obtain the same results.

Create n-gram models:

``` r
library(janeaustenr)
library(tidygramr)
unigrams <- create_ngrams(austen_books(), "unigram")
bigrams <- create_ngrams(austen_books(), "bigram")
trigrams <- create_ngrams(austen_books(), "trigram")
```

Create a table of bigram frequencies (stop words removed):

``` r
library(tidytext)
library(janeaustenr)
library(tidygramr)
bigrams <- create_ngrams(austen_books(), "bigram", stopwords=stop_words)
bigram_freqs <- count_ngrams(bigrams, doc_title="book")
head(bigram_freqs)
```

    ## # A tibble: 6 x 2
    ##               ngram     n
    ##               <chr> <int>
    ## 1        sir thomas   287
    ## 2     miss crawford   215
    ## 3 captain wentworth   170
    ## 4    miss woodhouse   162
    ## 5   frank churchill   132
    ## 6      lady russell   118

Calculate tf-idf of bigrams (stop words removed):

``` r
library(tidytext)
library(janeaustenr)
library(tidygramr)
bigrams <- create_ngrams(austen_books(), "bigram", stopwords=stop_words)
bigram_tfidf <- create_tfidf(bigrams, doc_title="book")
head(bigram_tfidf)
```

    ## # A tibble: 6 x 6
    ##            title             ngram     n         tf      idf     tf_idf
    ##           <fctr>             <chr> <int>      <dbl>    <dbl>      <dbl>
    ## 1     Persuasion captain wentworth   170 0.02985599 1.791759 0.05349475
    ## 2 Mansfield Park        sir thomas   287 0.02873160 1.791759 0.05148012
    ## 3 Mansfield Park     miss crawford   215 0.02152368 1.791759 0.03856525
    ## 4     Persuasion      lady russell   118 0.02072357 1.791759 0.03713165
    ## 5     Persuasion        sir walter   113 0.01984545 1.791759 0.03555828
    ## 6           Emma    miss woodhouse   162 0.01700966 1.791759 0.03047722

For more information on tidy text mining, please see the excellent [Tidy Text Mining with R](http://tidytextmining.com/ngrams.html).
