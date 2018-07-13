#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

##################################
#       LIBRARIES
##################################
library(shiny)
library(readr)
library(visNetwork)

##################################
#    Read Input Data Files
##################################
nodes_travel_data <- read_csv("nodes_travel_mcccode_usrcount.csv") 
edgelist_travel_usrcount_withnames <- read_csv("edgelist_travel_mcccode_usrcount_withnames_asdf.csv")

#################################
#       Server logic
#################################
shinyServer(function(input, output) {
    
    ###########################
    #  Tab 1 -  Travel Network
    ###########################
# network visualization
# the thing to note with visNetwork, is that the column names ar
  output$network <- renderVisNetwork({
    # define the nodes & rename the columns.
    nodes <- nodes_travel_data[,1:5]
    colnames(nodes) <- c("id", "label", "koho", "travel", "group")
    
    #define edges
    edges <- edgelist <- edgelist_travel_usrcount_withnames[,1:3]
    
    set.seed(777)
    #actual visualization of the network
    visNetwork(nodes, edges, height = "900px", width = "80%") %>%
      visOptions(selectedBy = "group", 
                 highlightNearest = TRUE, 
                 nodesIdSelection = TRUE) %>%
      visNodes(size = 10) %>%
      visPhysics(stabilization = FALSE, maxVelocity = 3)
  })
  
  #######################################
  #  Tab 2 -  Nodes & their Attributes
  #######################################
  output$nodes <- DT::renderDataTable(

    DT::datatable(nodes_travel_data, options = list(paging = FALSE))
  )
  
  ###########################
  #  Tab 3 -  Edges
  ###########################
  output$edges <- DT::renderDataTable(
    DT::datatable(edgelist_travel_usrcount_withnames, options = list(pageLength = 15))
  )
  
  # Tab 4 - Terminology is defined in  ui.R
  
  ###########################
  #  Tab 5 -  About
  ###########################
  url <- a("Monika M. Heinig, PhD", href="www.linkedin.com/in/monika-heinig")
  
  output$url <- renderUI({ tagList("Link to my LinkedIn page:", url) })

  })
