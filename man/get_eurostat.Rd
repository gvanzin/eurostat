% Generated by roxygen2 (4.0.1): do not edit by hand
\name{get_eurostat}
\alias{get_eurostat}
\title{Download a dataset from the eurostat database (ec.europa.eu/eurostat).}
\usage{
get_eurostat(id = "educ_iste")
}
\arguments{
\item{id}{A code name for the data set of interest. See the table of contents of eurostat datasets for details.

Returns:}
}
\value{
A dataset in the molten format with the last column 'value'. See the melt function from reshape package for more details.
}
\description{
Download a dataset from the eurostat database. The dataset is transformed into the molten / row-column-value format (RCV).

Arguments:
}
\details{
Data is downloaded from \code{http://epp.eurostat.ec.europa.eu/NavTree_prod/everybody/BulkDownloadListing} website.
}
\examples{
\dontrun{
   tmp <- get_eurostat("educ_iste")
   head(tmp)
   t1 <- get_eurostat("tsdtr420")
   tmp <- cast(t1, geo ~ time , mean, subset=victim=="KIL_MIO_POP")
   tmp2 <- tmp[c(1:10,14:30),1:19]
   tmp3 <- tmp2
   rownames(tmp3) <- tmp2[,1]
   tmp3 <- tmp3[c("UK", "SK", "FR", "PL", "ES", "PT", "LV"),]
   matplot(1991:2008, t(tmp3[,-1]), type="o",
           pch=19, lty=1, las=1,
	      xlab="", ylab="", yaxt="n")
   }
}
\author{
Przemyslaw Biecek, Leo Lahti \email{louhos@googlegroups.com} and Janne Huovari \email{janne.huovari@ptt.fi}
}
\references{
see citation("eurostat").
}
\seealso{
\code{\link{getEurostatTOC}}, \code{\link{getEurostatRaw}}
}
\keyword{database}
\keyword{utilities}
