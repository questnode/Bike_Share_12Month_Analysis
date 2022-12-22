library(geosphere)
library(dplyr)
file <- "C:\\Users\\rayyao\\Documents\\RStudio\\Case Study 1\\Analysis\\ETL\\tripdata_202111-202210.csv" 

#trips = read.csv(file.choose())
trips = read.csv(file)



#distm(trip[(1),c('start_lng','start_lat')], trip[(1),c('end_lng','end_lat')])

dist = geosphere::distHaversine(trips[(1),cbind('start_lng','start_lat')], trips[(1),cbind('end_lng','end_lat')])
print(dist)

trips <- trips%>%dplyr::mutate(linear_distance=geosphere::distHaversine(cbind(start_lng,start_lat), cbind(end_lng,end_lat)))
