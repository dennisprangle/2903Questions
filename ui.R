library(shiny)
library(shinythemes)
library(rmarkdown)
# Current completed examples
examples = c(" ", "1.2 Bayes Theorem", "1.2 Bayes Theorem 2", "1.3 Maximum Likelihood",
             "2.1 Prior/Posterior Probabilities", "2.2 Exponential Prior",
             "3.3 Truncated Distributions")
# Remaining examples to add
# "2.2 Normal Prior", "3.6 Asymptotic Posterior", "4.1 Credible Intervals", "4.1 Discrete HDI", "4.1 HDI", "4.2 Predictive Distributions", "4.2 Predictive Probability Function", "4.3 Sequential Use of Bayes Theorem")

# TO DO: add a warning that math symbols will take a few seconds to load
shinyUI(fluidPage(theme = shinytheme("sandstone"),
                selectInput(inputId="example", label="Choose a Topic", choices=examples),
                actionButton(inputId="show",label="Reveal Answers"),
                mainPanel(
                  htmlOutput("question", header=""),
                  htmlOutput("solution", header="")
                )
))
