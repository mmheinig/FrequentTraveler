# FrequentTraveler

This is a shiny web application based in R, with the main focus on network visualization, which was done with the package visNetwork. This project is the code for my web application, the Frequent Traveler (bit.ly/FrequentTraveler), which was a deliverable for my Insight Data Science project. For more information about the project (& its code), please see my other repository "Insight". (Briefly, analysis on transactional data was done in python, yielding 2 csv files corresponding to an edgelist & nodes (with their attributes) of a network with respect to travel merchants. These csv files are the inputs for this web application, as I prefer the visualization in R.)

At a quick glance, here are the other files in this repository & what they are. 

edgelist_travel_mcccode_usrcount_withnames_asdf.csv: an edge list with edge weight defined as usercount (number of users who made purchases at both endnode merchants). Since the merchants are simply numbers (defined by mcc_code), I also added their mcc_description for informational purposes.

nodes_travel_mcccode_usrcount.csv: a list of nodes, as defined by mcc_code and are restricted to travel related merchants, and their attributes (including community (from Louvain community detection algorithm), degree (number of other nodes it is connected to), betweenness centrality, closeness centrality, eigenvector centrality, and neighbors (who else it is connected to)).



