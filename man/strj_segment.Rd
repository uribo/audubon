% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/strj-segment.R
\name{strj_segment}
\alias{strj_segment}
\title{Segment text into phrases}
\usage{
strj_segment(text, format = c("list", "data.frame"), split = FALSE)
}
\arguments{
\item{text}{Character vector to be tokenized.}

\item{format}{Output format. Choose \code{list} or \code{data.frame}.}

\item{split}{Logical. If true, the function splits vectors
into some sentences using \code{stringi::stri_split_boundaries(type = "sentence")}
before tokenizing.}
}
\value{
List or data.frame.
}
\description{
Segment Japanese text into several phrases
using the 'google/budoux' JavaScript module.
}
\examples{
strj_segment(
  paste0(
    "\u3042\u306e\u30a4\u30fc\u30cf\u30c8",
    "\u30fc\u30f4\u30a9\u306e\u3059\u304d",
    "\u3068\u304a\u3063\u305f\u98a8"
  )
)
strj_segment(
  paste0(
    "\u3042\u306e\u30a4\u30fc\u30cf\u30c8",
    "\u30fc\u30f4\u30a9\u306e\u3059\u304d",
    "\u3068\u304a\u3063\u305f\u98a8"
  ),
  format = "data.frame"
)
}
