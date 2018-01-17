library(markdown)
library(knitr)
library(shiny)

example_lookup = c("1.2 Bayes Theorem"="BayesProbability.Rmd","1.2 Bayes Theorem 2"="BayesProbability2.Rmd","1.3 Maximum Likelihood"="MaximumLikelihood.Rmd","2.1 Prior Density Plots"="PriorDensityPlots.Rmd","2.1 Prior/Posterior Probabilities"="PriorPosteriorProbabilities.Rmd","2.2 Exponential Prior"="ExponentialPrior.Rmd","2.2 Normal Prior"="NormalPrior.Rmd","3.3 Truncated Distributions"="TruncatedDistributions.Rmd","3.5 Jeffreys Prior"="JeffreysPrior.Rmd","3.6 Asymptotic Posterior"="AsymptoticPosterior.Rmd","4.1 Credible Intervals"="CredibleIntervals.Rmd","4.1 Discrete HDI"="DiscreteHDI.Rmd","4.1 HDI 1"="HDIntervals.Rmd","4.1 HDI 2"="HDIntervals2.Rmd","4.1 HDI 3"="HDIntervals3.Rmd","4.2 Predictive Distributions"="PredictiveDistributions.Rmd","4.2 Predictive Probability Function"="PredictiveProbFunc.Rmd","4.3 Sequential Use of Bayes Theorem"="SequentialBayes.Rmd")
solution_lookup = c("1.2 Bayes Theorem"="BayesProbability_sol.Rmd","1.2 Bayes Theorem 2"="BayesProbability2_sol.Rmd","1.3 Maximum Likelihood"="MaximumLikelihood_sol.Rmd","2.1 Prior Density Plots"="PriorDensityPlots_sol.Rmd","2.1 Prior/Posterior Probabilities"="PriorPosteriorProbabilities_sol.Rmd","2.2 Exponential Prior"="ExponentialPrior_sol.Rmd","2.2 Normal Prior"="NormalPrior_sol.Rmd","3.3 Truncated Distributions"="TruncatedDistributions_sol.Rmd","3.5 Jeffreys Prior"="JeffreysPrior_sol.Rmd","3.6 Asymptotic Posterior"="AsymptoticPosterior_sol.Rmd","4.1 Credible Intervals"="CredibleIntervals_sol.Rmd","4.1 Discrete HDI"="DiscreteHDI_sol.Rmd","4.1 HDI 1"="HDIntervals_sol.Rmd","4.1 HDI 2"="HDIntervals2_sol.Rmd","4.1 HDI 3"="HDIntervals3_sol.Rmd","4.2 Predictive Distributions"="PredictiveDistributions_sol.Rmd","4.2 Predictive Probability Function"="PredictiveProbFunc_sol.Rmd","4.3 Sequential Use of Bayes Theorem"="SequentialBayes_sol.Rmd")

shinyServer(function(input,output){
  seed <- as.numeric(Sys.time())  
  
  makeQuestion <- function(x) {
    set.seed(seed)
    #TO DO: create unique temp filename to knit to. Ensure we delete this file below.
    ex_file = knit(example_lookup[x], quiet = TRUE)
    question = HTML(markdownToHTML(ex_file))
    withMathJax(question)
  }
  makeSolution <- function(x) {
    set.seed(seed)
    #TO DO: create unique temp filename to knit to. Ensure we delete this file below.
    sol_file = knit(solution_lookup[x], quiet=TRUE)
    solution = HTML(markdownToHTML(sol_file))
    withMathJax(solution)
  }
  output$question <- renderUI({makeQuestion(input$example)})
  output$solution <- renderUI({makeSolution(input$example)})
})