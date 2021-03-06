\name{reactiveText}
\alias{reactiveText}
\title{Text Output}
\usage{
  reactiveText(func)
}
\arguments{
  \item{func}{A function that returns an R object that can
  be used as an argument to \code{cat}.}
}
\description{
  Makes a reactive version of the given function that also
  uses \code{\link[base]{cat}} to turn its result into a
  single-element character vector.
}
\details{
  The corresponding HTML output tag can be anything (though
  \code{pre} is recommended if you need a monospace font
  and whitespace preserved) and should have the CSS class
  name \code{shiny-text-output}.

  The result of executing \code{func} will passed to
  \code{cat}, inside a \code{\link[utils]{capture.output}}
  call.
}
\examples{
isolate({

# reactivePrint captures any print output, converts it to a string, and
# returns it
visFun <- reactivePrint(function() "foo")
visFun()
# '[1] "foo"'

invisFun <- reactivePrint(function() invisible("foo"))
invisFun()
# ''

multiprintFun <- reactivePrint(function() {
  print("foo");
  "bar"
})
multiprintFun()
# '[1] "foo"\\n[1] "bar"'

nullFun <- reactivePrint(function() NULL)
nullFun()
# 'NULL'

invisNullFun <- reactivePrint(function() invisible(NULL))
invisNullFun()
# ''

vecFun <- reactivePrint(function() 1:5)
vecFun()
# '[1] 1 2 3 4 5'


# Contrast with reactiveText, which takes the value returned from the function
# and uses cat() to convert it to a string
visFun <- reactiveText(function() "foo")
visFun()
# 'foo'

invisFun <- reactiveText(function() invisible("foo"))
invisFun()
# 'foo'

multiprintFun <- reactiveText(function() {
  print("foo");
  "bar"
})
multiprintFun()
# 'bar'

nullFun <- reactiveText(function() NULL)
nullFun()
# ''

invisNullFun <- reactiveText(function() invisible(NULL))
invisNullFun()
# ''

vecFun <- reactiveText(function() 1:5)
vecFun()
# '1 2 3 4 5'

})
}
\seealso{
  \code{\link{reactivePrint}} for capturing the print
  output of a function, rather than the returned text
  value.
}

