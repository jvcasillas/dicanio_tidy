# Tidy some data --------------------------------------------------------------
#
# (a) Convert the columns val_F0 and val_int into long format. 
# Right now, there are 9 values across each interval (numbered 1-9) and 
# create a column "Time", numbered 1-9.
#
# (b) After this, I make sure all Ø and "0" are NA.
#
# (c) Then, I create a column log(F0) and read the data into R to run my 
# R code to do by-speaker F0 normalization/standardization.
#
# (d) I often need to recode the data to extract a column containing tonal 
# information. I might do this by copying over the Segment column into a 
# Tonal column and then deleting all non-numerical values. I kind of like 
# using existing annotations to create new ones.
#
# -----------------------------------------------------------------------------


# Load libraries --------------------------------------------------------------

library("tidyverse")
library("here")
library("janitor")

# -----------------------------------------------------------------------------


# Tidy data -------------------------------------------------------------------

read_delim(here("ASM_data.txt"), delim = "\t") %>%
  clean_names() %>% 
  pivot_longer(cols = x1val_f0:x9val_int, names_to = c("time", ".value"), 
    names_sep = "_") %>% 
  mutate(time = str_extract(time, "[:digit:]"), 
         log_f0 = log(f0), 
         f0_std = (f0 - mean(f0, na.rm = T)) / sd(f0, na.rm = T), 
         tonal = str_extract_all(segment, "[[:digit:]]+", simplify = T)) %>% 
  write_csv("ASM_data_tidy.csv") %>% View

# Note: It looks like it's all one speaker (as far as I can tell) but I 
# standardized f0 anyway

# -----------------------------------------------------------------------------
