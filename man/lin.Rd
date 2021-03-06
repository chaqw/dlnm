\name{lin}
\alias{lin}

\title{ Generate a Basis Matrix with a Variable as Linear }

\description{
The function generates a basis matrix including a linear un-transformed variable. It is meant to be used internally by \code{\link{onebasis}} and \code{\link{crossbasis}} and not directly run by the users.
}

\usage{
lin(x, intercept=FALSE)
}

\arguments{
  \item{x }{ the predictor variable. Missing values are allowed.}
  \item{intercept }{ logical. If \code{TRUE}, an intercept is included in the basis matrix, namely a vector of 1's.}
}

\details{
The function returns a basis matrix with the un-transformed variable, optionally with an intercept if \code{intercept=TRUE}.
}

\value{
A matrix object of class \code{"lin"}. It contains the attribute \code{intercept}.
}

\author{Antonio Gasparrini <\email{antonio.gasparrini@lshtm.ac.uk}>}

\note{
This function is mainly used internally thorugh \code{\link{onebasis}} to create basis matrices. It is not exported in the namespace, and can be accessed through the triple colon operator '\code{:::}' (see Examples below). 
}

\seealso{
\code{\link{onebasis}} to generate basis matrices and \code{\link{crossbasis}} to generate cross-basis matrices.

See \code{\link{dlnm-package}} for an introduction to the package and for links to package vignettes providing more detailed information.
}

\examples{
### simple use (accessing non-exported function through ':::')
dlnm:::lin(1:5)
dlnm:::lin(1:5, intercept=TRUE)

### use as an internal function in onebasis (note the centering)
b <- onebasis(chicagoNMMAPS$pm10, "lin")
summary(b)
model <- glm(death ~ b, family=quasipoisson(), chicagoNMMAPS)
pred <- crosspred(b, model, at=0:60)
plot(pred, xlab="PM10", ylab="RR", main="RR for PM10")
}

\keyword{smooth}

