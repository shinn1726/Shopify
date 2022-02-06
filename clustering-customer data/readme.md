# Executive Summary

This report is to show analysed data for the sales transaction of customers for an online retail store with an objective to perform segmentations:
•	The customers falling into same segment have similar purchasing patterns as below table.

I have considered top 2000 raws and customers. Studying and understanding these segments will help the reviewrs of this report to design and implement their promotional and marketing strategies in a better way. 

# Summary result of Customer Segmentation:

![Test Image 1](images/table1.PNG)

# About the data
I have tried to analyse sales transaction data for an online retail store for transactions between 10th January 2011 and 9th September 2011. 

Table Name – OnlineRetail

Following are the data columns available in input data in original version: -

•	Invoice No – It refers to unique receipt number generated for every sale transaction.<br />
•	Stock Code – It refers to unique alpha numeric code for every product.<br />
•	Description – It provides the name and brief description about the product.<br />
•	Quantity – Number of units purchased of a product.<br />
•	Invoice Date – It captures the date for every sale transaction.<br />
•	Unit Price – It refers to price for each unit of product.<br />
•	Customer ID – Unique number generated for every customer.<br />
•	Country – Country of residence of the customer.<br />
•	Invoice Date Time – It captures the date and time for every sale transaction.<br />

Data Summary

Total number of records – 541909
Number of distinct products - 3940
Number of distinct customers – 4373
Number of distinct countries – 38

Please refer to 'dataset.csv' for more details. (The data set is after cleanedd and secelcted from MySQL database using SQL query)
Selected features
![Test Image 1](images/customer_selected features.PNG)

# Data Cleaning and Outlier Removal

After analysing customer data, I removed NULL value using SQL queries.
Now, I plotted the data distribution for every feature (using ggpair), to visualise the outliers in them (if any):

![Test Image 1](images/outlier_remove.PNG)


