# FrequentTraveler

From the edge list file (edgelist_travel_mcccode_usrcount_withnames_asdf.csv) & and node file (nodes_travel_mcccode_usrcount.csv), the server.R and ui.R are the code to create the website bit.ly/FrequentTraveler.

The node file contains the name of the nodes as well as other node attributes including community (from Louvain community detection algorithm), degree (number of other nodes it is connected to), betweenness centrality, closeness centrality, eigenvector centrality, and neighbors (who else it is connected to). All attributes were calculated in python.
