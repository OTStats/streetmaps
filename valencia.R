# Valencia

library(tidyverse)
library(osmdata)

city <- "Valencia Spain"
streets <- getbb(city) %>%
  opq() %>%
  add_osm_feature(key = "highway",
                  value = c("motorway", "primary", "road",
                            "secondary", "tertiary", "unclassified",
                            "residential", "living_street", "footway")) %>%
  osmdata_sf()
all_streets <- getbb(city) %>%
  opq() %>%
  add_osm_feature(key = "highway") %>%
  osmdata_sf()


small_streets <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("service", "footway", "trunk")) %>% 
  osmdata_sf()

railway <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "railway") %>%
  osmdata_sf()

river <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()


ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) +
  geom_sf(data = railway$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .6) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) +
  # geom_sf(data = river$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .2,
  #         alpha = .5) +
  coord_sf(xlim = c(-0.435, -0.34), 
           ylim = c(39.43, 39.5),
           expand = FALSE) +
  theme_void()


p <- ggplot() +
  geom_sf(data = all_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) +
  geom_sf(data = railway$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .6) +
  coord_sf(xlim = c(-0.43, -0.335), 
           ylim = c(39.43, 39.5025),
           expand = FALSE) +
  theme_void() + 
  geom_segment(aes(x = -0.43, y = 39.43, xend = -0.335, yend = 39.43), size = 3) + # bottom
  geom_segment(aes(x = -0.43, y = 39.5025, xend = -0.335, yend = 39.5025), size = 3) + # top
  geom_segment(aes(x = -0.43, y = 39.43, xend = -0.43, yend = 39.5025), size = 3) + # left
  geom_segment(aes(x = -0.335, y = 39.43, xend = -0.335, yend = 39.5025), size = 3) # right

ggsave(filename = "../Desktop/valencia-3.png", p, width = 888, height = 877, units = "mm")

library(magick)
library(ggimage)

d <- image_read(path = "../Desktop/valencia.png")

d %>% image_frame(color = "black")


pp <- p + theme(plot.margin=grid::unit(c(2,2,2,2), "mm"))
ggsave(filename = "../Desktop/valencia-4.png", pp)
