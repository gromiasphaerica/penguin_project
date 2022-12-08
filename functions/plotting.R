#plot culmen length as a linear function of body mass 
plot_length_mass <- function(penguins_NA){
  penguins_NA %>%
    ggplot(penguins_NA, mapping = aes(x = body_mass_g, y=culmen_length_mm)) +
    geom_point(colour="blue") +
    geom_smooth(method="lm", col="red") +
    stat_regline_equation() +
    labs(title = "Culmen length as a function of body mass", x="Body mass (g)", y="Culmen length (mm)") +
    theme_bw()
}

#Save the plot as a svg and define the size and scaling
save_lm_plot_svg <- function(penguins_NA, filename, size, scaling){
  size_inches = size/2.54
  svglite(filename, width = size_inches, height = size_inches, scaling = scaling)
  lm_plot <- plot_length_mass(penguins_NA)
  print(lm_plot)
  dev.off()
}