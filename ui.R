lookup<-c("1.2 Bayes Theorem"="BayesProbability.Rmd","1.2 Bayes Theorem 2"="BayesProbability2.Rmd","1.3 Maximum Likelihood"="MaximumLikelihood.Rmd","2.1 Prior Density Plots"="PriorDensityPlots.Rmd","2.1 Prior/Posterior Probabilities"="PriorPosteriorProbabilities.Rmd","2.2 Exponential Prior"="ExponentialPrior.Rmd","2.2 Normal Prior"="NormalPrior.Rmd","3.3 Truncated Distributions"="TruncatedDistributions.Rmd","3.5 Jeffreys Prior"="JeffreysPrior.Rmd","3.6 Asymptotic Posterior"="AsymptoticPosterior.Rmd","4.1 Credible Intervals"="CredibleIntervals.Rmd","4.1 Discrete HDI"="DiscreteHDI.Rmd","4.1 HDI 1"="HDIntervals.Rmd","4.1 HDI 2"="HDIntervals2.Rmd","4.1 HDI 3"="HDIntervals3.Rmd","4.2 Predictive Distributions"="PredictiveDistributions.Rmd","4.2 Predictive Probability Function"="PredictiveProbFunc.Rmd","4.3 Sequential Use of Bayes Theorem"="SequentialBayes.Rmd")
library(shiny)
library(shinythemes)
library(exams)
library(rmarkdown)
library(shinyjs)
shinyUI(fluidPage(
  shinyjs::useShinyjs(),
  shinyjs::extendShinyjs(text="shinyjs.refresh=function() {location.reload();}"),
  theme = shinytheme("sandstone"),
                selectInput(inputId="var",label="Choose a Topic",choices=lookup,selected="BayesProbability.Rmd"),
                actionButton(inputId="show",label="Reveal Answers"),
                actionButton(inputId="refresh",label="New Question Set"),
                mainPanel(
                  htmlOutput("question", header=""),
                  conditionalPanel(condition="input.show%2 == 1", htmlOutput("solution"), header="",label="sol")
                )
))
