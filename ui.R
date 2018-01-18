library(shiny)
library(shinythemes)
library(rmarkdown)
# Full list of examples
# examples = c("1.2 Bayes Theorem", "1.2 Bayes Theorem 2", "1.3 Maximum Likelihood", "2.1 Prior Density Plots", "2.1 Prior/Posterior Probabilities", "2.2 Exponential Prior", "2.2 Normal Prior", "3.3 Truncated Distributions", "3.5 Jeffreys Prior", "3.6 Asymptotic Posterior", "4.1 Credible Intervals", "4.1 Discrete HDI", "4.1 HDI 1", "4.1 HDI 2", "4.1 HDI 3", "4.2 Predictive Distributions", "4.2 Predictive Probability Function", "4.3 Sequential Use of Bayes Theorem")
# Those which are polished and available
examples = c(" ", "1.2 Bayes Theorem", "1.2 Bayes Theorem 2")

# TO DO: add a warning that math symbols will take a few seconds to load
shinyUI(fluidPage(theme = shinytheme("sandstone"),
                selectInput(inputId="example", label="Choose a Topic", choices=examples),
                actionButton(inputId="show",label="Reveal Answers"),
                mainPanel(
                  htmlOutput("question", header=""),
                  htmlOutput("solution", header="")
                )
))
