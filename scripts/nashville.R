# Nashville ####
library(osmdata)
library(tidyverse)
nash_streets <- getbb("Nashville TN") %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>% 
  osmdata_sf()

nash_small_streets <- getbb("Nashville TN") %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("road", "cycleway", "living_street", "footway")) %>%
  osmdata_sf()

nash_river <- getbb("Nashville TN") %>% 
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()

water <- getbb("Nashville TN") %>%
  opq()%>%
  add_osm_feature(key = "natural", value = "water") %>%
  osmdata_sf()
  


ggplot() +
  geom_sf(data = nash_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) +
  geom_sf(data = nash_small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) +
  geom_sf(data = nash_river$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .5) + 
  # geom_sf(data = water$osm_multipolygons, 
  #         inherit.aes = F, 
  #         color = "black") + 
  coord_sf(xlim = c(-86.95, -86.65), 
           ylim = c(36.07, 36.26),
           expand = FALSE) + 
  labs(caption = "NASHVILLE") + 
  theme_void() + 
  theme(legend.position = "none",
        plot.caption = element_text(color = "grey20", 
                                    size = 70, 
                                    hjust = 1, 
                                    face = "plain", 
                                    family = "Didot")
  )
  # theme(plot.background = element_rect(fill = "#282828"))
ggsave("map.png", width = 297, height = 420, units = "mm", dpi = "retina")




# ----------------- Alt color scheme
ggplot() +
  geom_sf(data = nash_streets$osm_lines,
          inherit.aes = FALSE,
          color = "#7fc0ff",
          size = .4,
          alpha = .8) +
  geom_sf(data = nash_small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "#ffbe7f",
          size = .2,
          alpha = .6) +
  geom_sf(data = nash_river$osm_lines,
          inherit.aes = FALSE,
          color = "#ffbe7f",
          size = .2,
          alpha = .5) + 
  coord_sf(xlim = c(-87.05, -86.5), 
           ylim = c(35.97, 36.4),
           expand = FALSE) + 
  theme_void() + 
  theme(plot.background = element_rect(fill = "#282828"))