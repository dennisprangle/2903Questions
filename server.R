lookup<-c("1.2 Bayes Theorem"="BayesProbability.Rmd","1.2 Bayes Theorem 2"="BayesProbability.Rmd","1.3 Maximum Likelihood"="MaximumLikelihood.Rmd","2.1 Prior Density Plots"="PriorDensityPlots.Rmd","2.1 Prior/Posterior Probabilities"="PriorPosteriorProbabilities.Rmd","2.2 Exponential Prior"="ExponentialPrior.Rmd","2.2 Normal Prior"="NormalPrior.Rmd","3.3 Truncated Distributions"="TruncatedDistributions.Rmd","3.5 Jeffreys Prior"="JeffreysPrior.Rmd","3.6 Asymptotic Posterior"="AsymptoticPosterior.Rmd","4.1 Credible Intervals"="CredibleIntervals.Rmd","4.1 Discrete HDI"="DiscreteHDI.Rmd","4.1 HDI 1"="HDIntervals.Rmd","4.1 HDI 2"="HDIntervals2.Rmd","4.1 HDI 3"="HDIntervals3.Rmd","4.2 Predictive Distributions"="PredictiveDistributions.Rmd","4.2 Predictive Probability Function"="PredictiveProbFunc.Rmd","4.3 Sequential Use of Bayes Theorem"="SequentialBayes.Rmd")
library(exams)
library(rmarkdown)
library(shiny)
library(shinythemes)
shinyServer(function(input,output){
  seed <- as.numeric(Sys.time())  
  
  makeQuestion <- function(ex) {
    set.seed(seed)
    exams2html(ex, mathjax = TRUE, solution = FALSE, dir = "question", template="plain1.html", converter = "pandoc",quiet=TRUE)
    withMathJax(includeHTML("question/plain11.html"))
  }
  makeSolution <- function(ex) {
    set.seed(seed)
    exams2html(ex, mathjax = TRUE, question = FALSE, dir = "solution", template="plain1.html", converter = "pandoc", quiet=TRUE)
    withMathJax(includeHTML("solution/plain11.html"))
  }
  output$question <- renderUI({makeQuestion(input$var)})
  output$solution <- renderUI({makeSolution(input$var)})
})
