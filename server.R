library(rmarkdown)
library(knitr)
library(shiny)

lookup = list(" "=c("blank"),
              "1.2 Bayes Theorem"=c("BayesProbability"),
              "1.2 Bayes Theorem 2"=c("BayesProbability2"),
              "1.3 Maximum Likelihood"=c("MLE_gamma", "MLE_normal", "MLE_exp"),
              "2.1 Prior Density Plots"=c("PriorDensityPlots"),
              "2.1 Prior/Posterior Probabilities"=c("PriorPosteriorProbabilities"),
              "2.2 Exponential Prior"=c("ExponentialPrior"),
              "2.2 Normal Prior"=c("NormalPrior"),
              "3.3 Truncated Distributions"=c("TruncatedDistributions"),
              "3.5 Jeffreys Prior"=c("JeffreysPrior"),
              "3.6 Asymptotic Posterior"=c("AsymptoticPosterior"),
              "4.1 Credible Intervals"=c("CredibleIntervals"),
              "4.1 Discrete HDI"=c("DiscreteHDI.Rmd"),
              "4.1 HDI"=c("HDIntervals", "HDIntervals2", "HDIntervals3"),
              "4.2 Predictive Distributions"=c("PredictiveDistributions"),
              "4.2 Predictive Probability Function"=c("PredictiveProbFunc"),
              "4.3 Sequential Use of Bayes Theorem"=c("SequentialBayes.Rmd"))

shinyServer(function(input,output){
  seed = 0
  ex_name = "blank"
  makeHTML = function(filename) {
    set.seed(seed)
    filename_temp = tempfile()
    render(filename, output_file=filename_temp)
    out = withMathJax(includeHTML(filename_temp))
    unlink(filename_temp)
    out
  }
  observeEvent(input$example, {
    seed <<- as.numeric(Sys.time())
    ex_name <<- sample(lookup[[input$example]], 1)
    ex_file = paste(ex_name, ".Rmd", sep="")
    output$question = renderUI({makeHTML(ex_file)})
    output$solution = renderUI({makeHTML("blank.Rmd")})
  })
  observeEvent(input$show, {
    sol_file = paste(ex_name, "_sol.Rmd", sep="")
    output$solution = renderUI({makeHTML(sol_file)})
  })
})