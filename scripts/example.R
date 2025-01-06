library(tidyverse)
install.packages("osmdata")
library(osmdata)

available_tags("highway")
available_tags("waterway")

# Milwaukee ####
streets <- getbb("Milwaukee Wisconsin") %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>% 
  osmdata_sf()


small_streets <- getbb("Milwaukee Wisconsin") %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = "unclassified") %>%
  osmdata_sf()

river <- getbb("Milwaukee Wisconsin") %>% 
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()

water <- getbb("Milwaukee Wisconsin") %>% 
  opq()%>%
  add_osm_feature(key = "natural", value = "water") %>%
  osmdata_sf()


ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) +
  coord_sf(xlim = c(-87.85, -88.1), 
           ylim = c(42.91, 43.2),
           expand = FALSE) 




ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .05,
          alpha = .09) +
  geom_sf(data = river$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .5) +
  geom_sf(data = water$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .5) +
  coord_sf(xlim = c(-87.85, -88.1), 
           ylim = c(42.91, 43.2),
           expand = FALSE) + 
  theme_void()




ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "#7fc0ff",
          size = .4,
          alpha = .8) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "#ffbe7f",
          size = .2,
          alpha = .6) +
  geom_sf(data = river$osm_lines,
          inherit.aes = FALSE,
          color = "#ffbe7f",
          size = .2,
          alpha = .5) +
  geom_sf(data = water$osm_lines,
          inherit.aes = FALSE,
          color = "#ffbe7f",
          size = .2,
          alpha = .5) +
  coord_sf(xlim = c(-87.85, -88.1), 
           ylim = c(42.91, 43.2),
           expand = FALSE) + 
  theme_void() +
  theme(plot.background = element_rect(fill = "#282828"))


# Nashville ####
streets <- getbb("Nashville TN") %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>% 
  osmdata_sf()


small_streets <- getbb("Nashville TN") %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("road")) %>%
  osmdata_sf()

river <- getbb("Nashville TN") %>% 
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()

ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8)



ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .05,
          alpha = .09) +
  geom_sf(data = river$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .5) + 
  coord_sf(xlim = c(-87.05, -86.5), 
           ylim = c(35.97, 36.4),
           expand = FALSE) + 
  theme_void()
