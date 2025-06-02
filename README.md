
<!-- README.md is generated from README.Rmd. Please edit that file -->

# onyourmark

<!-- badges: start -->
<!-- badges: end -->

onyourmark is a package for setting up projects the way I like to set up
projects. It’s just a bunch of wrappers around usethis functions to make
my life easier.

## Installation

You can install the development version of onyourmark like so:

``` r
# install.packages("pak")
pak::pak("MarkPaulin/onyourmark")
```

## How to use

Create a new project like this:

``` r
onyourmark::create_project("path/to/project")
```

You can set the `type` argument to create a pipeline or an app using
shiny instead of the vanilla package format. I’ll detail the structure
at some point.
