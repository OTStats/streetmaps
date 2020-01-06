# Nashville ####
nash_streets <- getbb("Nashville TN") %>% 
  opq() %>% 
  add_osm_feature(key = "highway") %>% 
  osmdata_sf()

nash_small_streets <- getbb("Nashville TN") %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("road")) %>%
  osmdata_sf()

nash_river <- getbb("Nashville TN") %>% 
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()

ggplot() +
  geom_sf(data = nash_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8)



ggplot() +
  geom_sf(data = nash_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) + 
  coord_sf(xlim = c(-87, -86.6), 
           ylim = c(36.0, 36.3),
           expand = FALSE)
  # coord_sf(xlim = c(-87, -86.7), 
  #          ylim = c(35.8, 36.05),
  #          expand = FALSE)
  theme_void()
  geom_sf(data = nash_small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .05,
          alpha = .09) +
  geom_sf(data = nash_river$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .5) + 




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
  
