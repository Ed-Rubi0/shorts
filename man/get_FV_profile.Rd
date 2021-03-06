% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_FV_summary.R
\name{get_FV_profile}
\alias{get_FV_profile}
\title{Get Force-Velocity Profile}
\usage{
get_FV_profile(
  MSS,
  TAU,
  bodymass = 75,
  max_time = 6,
  frequency = 100,
  RFmax_cutoff = 0.3,
  ...
)
}
\arguments{
\item{MSS}{Numeric vectors. Model parameters}

\item{TAU}{Numeric vectors. Model parameters}

\item{bodymass}{Body mass in kg. Used to calculate relative power and forwarded to \code{\link{get_air_resistance}}}

\item{max_time}{Predict from 0 to \code{max_time}. Default is 6seconds}

\item{frequency}{Number of samples within one second. Default is 100Hz}

\item{RFmax_cutoff}{Time cut-off used to estimate \code{RFmax} and \code{Drf}. Default is 0.3s}

\item{...}{Forwarded to \code{\link{get_air_resistance}} for the purpose of calculation of air resistance and power}
}
\value{
List containing the following elements:
    \describe{
        \item{bodymass}{Returned \code{bodymass} used in FV profiling}
        \item{F0}{Horizontal force when velocity=0}
        \item{F0_rel}{\code{F0} divided by \code{bodymass}}
        \item{V0}{Velocity when horizonatl force=0}
        \item{Pmax}{Maximal horizontal power}
        \item{Pmax_rel}{\code{Pmax} divided by \code{bodymass}}
        \item{FV_slope}{Slope of the FV profile. See References for more info}
        \item{RFmax}{Maximal force ratio after 0.3sec. See References for more info}
        \item{RFmax_cutoff}{Time cut-off used to estimate RFmax}
        \item{Drf}{Slope of Force Ratio (RF) and velocity. See References for more info}
        \item{RSE_FV}{Residual standard error of the FV profile.}
        \item{RSE_Drf}{Residual standard error of the RF-velocity profile}
        \item{data}{Data frame containing simulated data used to estimate parameters}
    }
}
\description{
Provides Force-Velocity (FV) profile suggested by Pierre Samozino and JB-Morin, et al.
}
\examples{
data("jb_morin")

m1 <- model_using_radar_with_time_correction(time = jb_morin$time, velocity = jb_morin$velocity)

get_FV_profile(
 MSS = m1$parameters$MSS,
  TAU = m1$parameters$TAU,
  bodyheight = 1.72,
  bodymass = 120)
}
\references{
Samozino P, Rabita G, Dorel S, Slawinski J, Peyrot N, Saez de Villarreal E, Morin J-B. 2016.
    A simple method for measuring power, force, velocity properties, and mechanical effectiveness in
    sprint running: Simple method to compute sprint mechanics. Scandinavian Journal of Medicine & Science
    in Sports 26:648–658. DOI: 10.1111/sms.12490.
}
