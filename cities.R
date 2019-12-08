library(tidyverse)
install.packages("osmdata")
library(osmdata)

available_tags("highway")
available_tags("natural")

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
  geom_sf(data = mke_streets$osm_lines,
          inherit.aes = FALSE,
          color = "#7fc0ff",
          size = .4,
          alpha = .8) +
  geom_sf(data = mke_small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "#ffbe7f",
          size = .2,
          alpha = .6) +
  geom_sf(data = mke_river$osm_lines,
          inherit.aes = FALSE,
          color = "#ffbe7f",
          size = .2,
          alpha = .5) +
  geom_sf(data = mke_water$osm_lines,
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
nash_streets <- getbb("Nashville TN") %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>% 
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
  geom_sf(data = streets$osm_lines,
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
  coord_sf(xlim = c(-87.05, -86.5), 
           ylim = c(35.97, 36.4),
           expand = FALSE) + 
  theme_void()

# Madrid ####
mad_streets <- getbb("Madrid Spain") %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>% 
  osmdata_sf()


mad_small_streets <- getbb("Madrid Spain") %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street",
                            "unclassified",
                            "service", "footway")) %>%
  osmdata_sf()

mad_river <- getbb("Madrid Spain") %>% 
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()
mad_railway <- getbb("Madrid Spain") %>% 
  opq()%>%
  add_osm_feature(key = "railway", value = "rail") %>%
  osmdata_sf()


ggplot() +
  geom_sf(data = mad_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) +
  geom_sf(data = mad_small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .05,
          alpha = .01) + 
  geom_sf(data = mad_railway$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .5) 
  coord_sf(xlim = c(-87.05, -86.5), 
           ylim = c(35.97, 36.4),
           expand = FALSE) + 
  theme_void()


# Valencia ####
streets <- getbb("Valencia Spain") %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", "road", 
                            "secondary", "tertiary", "unclassified", 
                            "residential")) %>% 
  osmdata_sf()


small_streets <- getbb("Valencia Spain") %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("living_street", "service", "footway", "trunk"))

river <- getbb("Valencia Spain") %>% 
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()


ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) +
  # geom_sf(data = small_streets$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .4,
  #         alpha = .6) +
  # geom_sf(data = river$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .2,
  #         alpha = .5) +
  coord_sf(xlim = c(-0.44, -0.34), 
           ylim = c(39.42, 39.51),
           expand = FALSE) +
  theme_void()

# Valencia 2 ####
city <- "Valencia Spain"
streets <- getbb(city) %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", "road", 
                            "secondary", "tertiary", "unclassified", 
                            "residential", "living_street", "footway")) %>% 
  osmdata_sf()


small_streets <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("service", "footway", "trunk"))

railway <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "railway", value = "rail") %>%
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
  # geom_sf(data = small_streets$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .4,
  #         alpha = .8) +
  # geom_sf(data = river$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .2,
  #         alpha = .5) +
  coord_sf(xlim = c(-0.435, -0.34), 
           ylim = c(39.43, 39.5),
           expand = FALSE) +
  theme_void()


# San Francisco ####
city <- "San Francisco"
streets <- getbb(city) %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", "road", 
                            "secondary", "tertiary", "unclassified")) %>% 
  osmdata_sf()


small_streets <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("service", "footway", "trunk", 
                            "residential", "living_street", "footway"))

# railway <- getbb(city) %>% 
#   opq()%>%
#   add_osm_feature(key = "railway", value = "rail") %>%
#   osmdata_sf()

# river <- getbb(city) %>% 
#   opq()%>%
#   add_osm_feature(key = "waterway", value = "river") %>%
#   osmdata_sf()

water <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "natural", value = c("water", "bay", "strait")) %>%
  osmdata_sf()
coast <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "natural", value = c("coastline", "bay")) %>%
  osmdata_sf()

ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) +
  geom_sf(data = railway$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .6) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .6) +
  geom_sf(data = coast$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .6) +
  geom_sf(data = water$osm_polygons,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) + 
  coord_sf(xlim = c(-122.6, -122.29), 
           ylim = c(37.63, 37.92),
           expand = FALSE) + theme_minimal()
  theme_void()
  
# Portland ####
city <- "Portland Oregon"
streets <- getbb(city) %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", "road", 
                            "secondary", "tertiary", "unclassified")) %>% 
  osmdata_sf()


small_streets <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("service", "footway", "trunk", 
                            "residential", "living_street", "footway"))

# railway <- getbb(city) %>% 
#   opq()%>%
#   add_osm_feature(key = "railway", value = "rail") %>%
#   osmdata_sf()

river <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()

water <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "natural", value = "strait") %>%
  osmdata_sf()
# coast <- getbb(city) %>%
#   opq()%>%
#   add_osm_feature(key = "natural", value = c("coastline", "bay")) %>%
#   osmdata_sf()

ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) +
  # geom_sf(data = railway$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .2,
  #         alpha = .6) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .6) +
  # geom_sf(data = coast$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .2,
  #         alpha = .6) +
  geom_sf(data = river$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) +
  geom_sf(data = water$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) +
  coord_sf(xlim = c(-122.75, -122.6), 
           ylim = c(45.475, 45.6),
           expand = FALSE) + theme_minimal()
  theme_void()
# New York City ####
city <- "New York City"
streets <- getbb(city) %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", "road", 
                            "secondary", "tertiary", "unclassified")) %>% 
  osmdata_sf()


small_streets <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("service", "footway", "trunk", 
                            "residential", "living_street", "footway"))

# railway <- getbb(city) %>% 
#   opq()%>%
#   add_osm_feature(key = "railway", value = "rail") %>%
#   osmdata_sf()

river <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()

water <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "natural", value = c("water", "bay", "strait")) %>%
  osmdata_sf()
# coast <- getbb(city) %>%
#   opq()%>%
#   add_osm_feature(key = "natural", value = c("coastline", "bay")) %>%
#   osmdata_sf()

ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) +
  # geom_sf(data = railway$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .2,
  #         alpha = .6) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .6, ) +
  # geom_sf(data = coast$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .2,
  #         alpha = .6) +
  # geom_sf(data = river$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .4,
  #         alpha = .6) +
  geom_sf(data = water$osm_multipolygons,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) +
  coord_sf(xlim = c(-74.1, -73.9), 
           ylim = c(40.65, 40.8),
           expand = FALSE) + theme_minimal()
# Venice ####

venice <- data.frame(min = c(12.3, 45.42), 
                     max = c(12.38, 45.46), row.names = c("x", "y")) %>% 
  as.matrix()
city <- "Venice Italy"
streets <- getbb(city) %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", "road", 
                            "secondary", "tertiary", "unclassified")) %>% 
  osmdata_sf()


small_streets <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("service", "footway", "trunk", 
                            "residential", "living_street", "footway"))

railway <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "railway", value = "rail") %>%
  osmdata_sf()

river <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "waterway", value = c("coastline", "tidal_channel", "bay")) %>%
  osmdata_sf()
river2 <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "waterway") %>%
  osmdata_sf()

natural <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "natural") %>%
  osmdata_sf()
water <- getbb(city) %>%
  opq()%>%
  add_osm_feature(key = "natural", value = "water") %>%
  osmdata_sf()
water2 <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "natural", value = "coastline") %>%
  osmdata_sf()
water3 <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "natural", value = "bay") %>%
  osmdata_sf()
# coast <- getbb(city) %>%
#   opq()%>%
#   add_osm_feature(key = "natural", value = c("coastline", "bay")) %>%
#   osmdata_sf()

ggplot() +
  
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) +
  geom_sf(data = railway$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .6) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .6, ) +
  # geom_sf(data = coast$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .2,
  #         alpha = .6) +
  # geom_sf(data = water$osm_multipolygons,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .4,
  #         alpha = .6)+
  # geom_sf(data = water2$osm_multipolygons,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .4,
  #         alpha = .6)+
  geom_sf(data = river2$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) +
  geom_sf(data = natural$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .6) + 
  coord_sf(xlim = c(12.3, 12.38), 
           ylim = c(45.42, 45.46),
           expand = FALSE) + theme_minimal()
  # geom_sf(data = river2$osm_polygons,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .4,
  #         alpha = .6)+

  
# Madrid 2 ####
if(!require("ggmap")) install.packages("ggmap")
get_map(getbb("Madrid"), maptype = "roadmap") %>% ggmap()
# Venice 2 ####
if(!require("ggmap")) install.packages("ggmap")
get_map(getbb("Venice"), maptype = "toner") %>% ggmap()

# Chicago ####
city <- "Chicago Illinois"
streets <- getbb(city) %>% 
  opq() %>% 
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>% 
  osmdata_sf()


small_streets <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = "living_street") %>%
  osmdata_sf()
railway <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "railway", value = "rail") %>%
  osmdata_sf()
river <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()
water <- getbb(city) %>% 
  opq()%>%
  add_osm_feature(key = "natural", value = "water") %>%
  osmdata_sf()

ggplot() +
  geom_sf(data = streets$osm_points,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .8) + 
  coord_sf(xlim = c(-87.94, -87.52), 
           ylim = c(41.64, 42))



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
  coord_sf(xlim = c(-87.94, -87.52), 
           ylim = c(41.64, 42)) + 
  theme_void()
