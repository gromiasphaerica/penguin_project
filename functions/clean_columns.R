#Clean column names, remove empty rows, remove columns called comment and delta
clean_columns <- function(data_raw){
  data_raw %>%
    clean_names() %>% #renames the remaining columns
    remove_empty(c("rows", "cols")) %>% #removes empty                                            data
    select(-starts_with("delta")) %>% #removes unwanted                                         columns
    select(-comments)
}


# Subset the data to only include the penguins that are not NA for the culmen length and body mass
remove_NA <- function(data_clean){
  data_clean %>%
    filter(!is.na(culmen_length_mm)) %>%
    filter(!is.na(body_mass_g)) %>%
    select(culmen_length_mm, body_mass_g)
}

#exclude everything except body mass and flipper length, along with removing any rows containing NAs
remove_NA_flipper_length <- function(data_clean){
  data_clean %>%
    filter(!is.na(body_mass_g)) %>%
    filter(!is.na(flipper_length_mm)) %>%
    select(species, body_mass_g, flipper_length_mm)
}
