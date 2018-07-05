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
  
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # network
  output$network <- renderVisNetwork({
    # minimal example
    #nodes <- data.frame(id = 1:3)
    nodes <- nodes_travel_data[,1:5]
    colnames(nodes) <- c("id", "label", "koho", "travel", "group")
    
    #edges <- data.frame(from = c(1,2), to = c(1,3))
    edges <- edgelist <- edgelist_travel_usrcount_withnames[,1:3]
    
    set.seed(777)
    visNetwork(nodes, edges, height = "900px", width = "80%") %>%
      visOptions(selectedBy = "group", 
                 highlightNearest = TRUE, 
                 nodesIdSelection = TRUE) %>%
      visNodes(size = 10) %>%
      visPhysics(stabilization = FALSE, maxVelocity = 3)
  })
  
  # display 10 rows initially
  output$nodes <- DT::renderDataTable(
   # DT::datatable(nodes_travel_data, options = list(paging = FALSE)) #list(pageLength = 25))
    DT::datatable(nodes_travel_data, options = list(paging = FALSE))
  )
  
  # -1 means no pagination; the 2nd element contains menu labels
  output$edges <- DT::renderDataTable(
    DT::datatable(edgelist_travel_usrcount_withnames, options = list(pageLength = 15))
  )
  
  url <- a("Monika M. Heinig, PhD", href="www.linkedin.com/in/monika-heinig")
  
  output$url <- renderUI({ tagList("Link to my LinkedIn page:", url) })
  # you can also use paging = FALSE to disable pagination
  #output$ex3 <- DT::renderDataTable(
  #  DT::datatable(iris, options = list(paging = FALSE))
  #)
  
  # turn off filtering (no searching boxes)
#  output$ex4 <- DT::renderDataTable(
#    DT::datatable(iris, options = list(searching = FALSE))
#  )
  
  # write literal JS code in JS()
#  output$ex5 <- DT::renderDataTable(DT::datatable(
#    iris,
#    options = list(rowCallback = DT::JS(
#      'function(row, data) {
#      // Bold cells for those >= 5 in the first column
#      if (parseFloat(data[1]) >= 5.0)
#      $("td:eq(1)", row).css("font-weight", "bold");
#}'
#    ))
#    ))
  })
