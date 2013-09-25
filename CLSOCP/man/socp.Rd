\name{socp}
\alias{socp}
\alias{prob}
\alias{soln}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Solve Second Order Cone Programs
}
\description{
Solves Second Order Cone Programs (SOCP) using the one step smoothing Newton method of Chi and Liu.
}
\usage{
socp(A, b, c, kvec, type = rep('q',length(kvec)), use_sparse=TRUE, gamma_fac=.95, delta0 = .75, sigma0 = .25, mu0 = 0.01, zero_tol = 1e-6, max_iter = 100, min_progress = zero_tol/100)
}

\arguments{
  \item{A}{
    \code{A} is a matrix containing the coefficients for the linear and second order cone constraints.  \code{A} should have \eqn{m} rows, where \eqn{m} is the number of constraints. The number of columns in \code{A} should be \code{sum(kvec)}.  \code{A} must have full row rank.
}
  \item{b}{
    \code{b} is a vector containing the affine terms of the constraints.
}
  \item{c}{
    \code{c} is a vector containing the coefficients of the objective function to be minimized.
}
  \item{kvec}{
    \code{kvec} is a vector containing the length of each constraint block.  
}
  \item{type}{
    \code{type} is a vector of the same length as \code{kvec} containing the type of each constraint block.  Possible values are "q" for second order cone blocks or "l" for linear blocks.
}
  \item{use_sparse}{
    \code{use_sparse} indicates whether or not to use sparse matrices (via the Matrix package) for computations.
}
  \item{gamma_fac}{
    \code{gamma_fac} is used to calculate gamma (see Chi and Liu, 2009) by \code{gamma <- gamma_fac*min(1,1/nrm_H)}
}
  \item{delta0}{
    A parameter affecting the behavior of the algorithm.  See Chi and Liu, 2009.
}
  \item{sigma0}{
    A parameter affecting the behavior of the algorithm.  See Chi and Liu, 2009.
}
  \item{mu0}{
    A parameter affecting the behavior of the algorithm.  See Chi and Liu, 2009.
}
  \item{zero_tol}{
    The threshold for completion of the algorithm.  See Chi and Liu, 2009.
}
  \item{max_iter}{
    The maximum number of allowed iterations if \code{zero_tol} is not reached.
}
  \item{min_progress}{
    The minimum progress that must be made on each iteration to continue execution.
}
}
\details{
A second order cone program (SOCP) is an optimization problem similar to a linear program (LP), except that some variables can be constrained by second order cones.   An exact mathematical definition can be found in Chi and Liu, 2009.  This function implements the algorithm given in that paper.  The algorithm has been extended here to allow for multiple second order cone constraints as well as linear constraints.  The objective function is given by \code{sum(c*x)} while the constraints are \code{A\%*\%x == b}, with \code{x} belonging to the cartesian product of second order cones described by \code{kvec} and \code{type}.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
A list containing named elements:
\item{x}{The optimal solution to the SOCP.  See details.}
\item{y}{The dual solution.  See Chi and Liu, 2009.}
\item{s}{Given by \code{c - t(A)\%*\%y}.  See Chi and Liu, 2009.}
\item{obj}{The value of the objective for the optimal solution.}
\item{code}{The status of the result.  0 indicates that the function completed with no problems.  1 indicates that a singularity occured.  2 indicates termination due to lack of progress.  3 indicates termination due to the maximum number of iterations being reached.  Only solutions with a code of 0 should be relied upon.}
\item{mu}{The final value of the smoothing parameter.  See Chi and Liu, 2009.}
\item{iter}{The number of iterations performed.}
}
\references{
Chi and Liu. A one-step smoothing Newton method for second-order cone programming. Journal of Computational and Applied Mathematics (2009) vol. 223 (1) pp. 114-123
}
\author{
Jason Rudy
}
\note{
No attempt is made to check the feasibility of the SOCP.  Infeasible inputs may result in unexpected behavior, although usually they will result in a failure code.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{

#Load an example SOCP
data(prob)

#Solve the socp
soln <- socp(prob$A, prob$b, prob$c, dim(prob$A)[2])


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{optimization}
\keyword{SOCP}
\keyword{CLSOCP}

