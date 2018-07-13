#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(readr)
library(visNetwork)

nodes_travel_data <- read_csv("nodes_travel_mcccode_usrcount.csv") 
edgelist_travel_usrcount_withnames <- read_csv("edgelist_travel_mcccode_usrcount_withnames_asdf.csv")
  
# Define server logic 
shinyServer(function(input, output) {
  
  # network
  output$network <- renderVisNetwork({
    
    nodes <- nodes_travel_data[,1:5]
    colnames(nodes) <- c("id", "label", "koho", "travel", "group")
    
    edges <- edgelist <- edgelist_travel_usrcount_withnames[,1:3]
    
    set.seed(777)
    visNetwork(nodes, edges, height = "900px", width = "80%") %>%
      visOptions(selectedBy = "group", 
                 highlightNearest = TRUE, 
                 nodesIdSelection = TRUE) %>%
      visNodes(size = 10) %>%
      visPhysics(stabilization = FALSE, maxVelocity = 3)
  })
  
  
  output$nodes <- DT::renderDataTable(
    DT::datatable(nodes_travel_data, options = list(paging = FALSE))
  )
  
  output$edges <- DT::renderDataTable(
    DT::datatable(edgelist_travel_usrcount_withnames, options = list(pageLength = 15))
  )
  
  url <- a("Monika M. Heinig, PhD", href="www.linkedin.com/in/monika-heinig")
  
  output$url <- renderUI({ tagList("Link to my LinkedIn page:", url) })
  

  })
