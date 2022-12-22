library(tidyverse)
library(fs)
library(dplyr)
library(stringr)

#Write the following lines:
folder_path <- "C:\\Users\\rayyao\\Documents\\RStudio\\Case Study 1\\Analysis\\rawdata" #File path to the folder with the *.csv files
output_file <- "C:\\Users\\rayyao\\Documents\\RStudio\\Case Study 1\\Analysis\\ETL\\tripdata_202111-202210.csv" #File path + file name for the resulting file

all_of_them <- fs::dir_ls(folder_path)
file_names <- list.files(folder_path)

#Write the following lines:
for (i in seq_along(file_names)) {

  #my_content <- read_csv(file = all_of_them[[i]], show_col_types = FALSE)  
    
  my_content <- read_csv(
    file = all_of_them[[i]], show_col_types = FALSE, nrows=1000)
  
  #Creates data frame for my_content.
  df <- data.frame(my_content)
  
  #Removes rows 1 to 301 for each *.csv file.
  #header_df <- file_names[i]
  #print(i)
  #if (i==0) {
  #  new_data <- df[-c(1:1),] #Removes specific rows, remove or modify if needed
  #}
  #new_data <- df
  #new_df <- data.frame(new_data)
  #new_df <- new_df%>%dplyr::mutate(sample=header_df)
  
  #Writes table with the data from all the *.csv files and
  #exports it in the output_file path.
  if (i>1) {
    names(df) <- NULL
  }
  write.table(df, file = output_file, sep = ",",
              append = TRUE, quote = FALSE,
              col.names = TRUE, row.names = FALSE)
}


#Export the created *.csv
created_csv <- read_csv(output_file)

#Creates a data frame for created_csv
collapsed_csv <- data.frame(created_csv)

write.csv(collapsed_csv, output_file, row.names = FALSE)


