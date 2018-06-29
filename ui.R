#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(readr)
library(visNetwork)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("The Frequent Traveler"),
  
  navbarPage(
    title = 'Tab Options',
    tabPanel('Travel Network', visNetworkOutput("network")),
    tabPanel('Nodes & their Attributes',     DT::dataTableOutput('nodes')),
    tabPanel('Edges',        DT::dataTableOutput('edges')) 
    #tabPanel('No pagination',      DT::dataTableOutput('ex3'))
    #tabPanel('No filtering',       DT::dataTableOutput('ex4')),
    #tabPanel('Function callback',  DT::dataTableOutput('ex5'))
  )
))
