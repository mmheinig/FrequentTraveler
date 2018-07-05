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
    title = 'Tabs',
    tabPanel('Travel Network', 'This is a visualization of the travel network from 
             travel purchases. From the first drop down, you can select a merchant
             by name, as defined by merchant category code description.
             The second drop down allows you to focus on communities, as identified
             by the Louvain Community Detection Algorithm.', 
             visNetworkOutput("network")),
    tabPanel('Nodes & their Attributes',     DT::dataTableOutput('nodes')),
    tabPanel('Edges',        DT::dataTableOutput('edges')),
    tabPanel('Terminology', 
             h5('Attributes'), 'information associated with nodes of the network',
             h5('Betweeenness centrality'), 'node attribute measuring centrality of the network based on shortest paths.',
             h5('Centrality'), 'a measurement to identify the most important nodes within a graph',
             h5('Closeness centrality'), 'node attribute measuring the mean distance from a node to other nodes.',
             h5('Community'), 'node attribute specifying which community the merchant
             belongs to, as determined by the Louvain Community Detection Algorithm',
             h5('Degree'), 'node attribute specifying the number of of other merchants
             a merchant is connected to',
             h5('Edge'), 'line or link connecting two merchants (or nodes)',
             h5('Eigenvector centrality'), 'node attribute measuring the influence of that node in the network',
             h5('Endnode'), 'merchants at the ends of an edge',
             h5('Koho Category'), 'categorization based on merchant type',
             h5("Louvain Community Detection Algorithm"), 'An algorithm that partitions
             the network into communities by optimizing modularity.',
             h5('Merchant Category Code'), 'a 4-digit number used by credit card companies to categorize transactions. Each code has an associated description with it. (Note, there may be several codes with the same description.)',
             h5('Modularity'), 'measurement of the density of edges within a community
             as compared to edges outside the community',
             h5('Neighbors'), 'node attribute listing out which other merchants a merchant is connected to',
             h5('Node'), 'a point within the network; here a node is a merchant in the network',
             h5('Partition'), 'dividing something into smaller parts',
             h5('Travel Category'), 'categorization including Air Carrier, Hotel, Timeshares, Cruiselines, Travel Agency, Busline, Airport Terminal, and Tourist Attractions',
             h5('Weight'), 'value associated with the edge. In this case weight
             is the number of users who made purchases at both endnodes.'),
    tabPanel('About', h3('Frequent Traveler'), 
             'This web application, Frequent Traveler, is the result of a consulting 
             project for a Candian bank. From over half a million transactional 
             records, a network was constructed from travel purchases (about 1.25% of
             all transactions) with merchants as the nodes of the 
             network. The merchants are connected by edges (or links) if there was 
             at least one customer who made purchases at both merchants. These edges 
             (or links) became weighted with the weight of each edge being the number 
             of customers who made purchases at both merchants.', 
             h3('About Me'), 'My name is Monika M. Heinig. I am currently a Fellow
                at Insight Data Science and I have my PhD in Mathematics from Stevens Institute of Technology.', 
                uiOutput('url'))
    #tabPanel('No pagination',      DT::dataTableOutput('ex3'))
    #tabPanel('No filtering',       DT::dataTableOutput('ex4')),
    #tabPanel('Function callback',  DT::dataTableOutput('ex5'))
  )
))
