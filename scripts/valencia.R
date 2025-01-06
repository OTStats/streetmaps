# Valencia

# -- load packages
library(tidyverse)
library(osmdata)
library(extrafont)
font_import()
load_fonts()
        

# -- import street data
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


# -- Plot
ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .6) +
  geom_sf(data = railway$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .2,
          alpha = .4) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          size = .4,
          alpha = .4) +
  # geom_sf(data = river$osm_lines,
  #         inherit.aes = FALSE,
  #         color = "black",
  #         size = .2,
  #         alpha = .5) +
  coord_sf(xlim = c(-0.435, -0.34), 
           ylim = c(39.43, 39.5),
           expand = FALSE) +
  labs(caption = "VALENCIA") + 
  theme_void() + 
  theme(legend.position = "none",
        plot.caption = element_text(color = "grey20", 
                                    size = 70, 
                                    hjust = .5, 
                                    face = "plain", 
                                    family = "Tahoma"
                                    )
  )

ggsave("plots/20250105 valencia.png", width = 297, height = 420, units = "mm", bg = "white")




# -- Work in progress ---------------------------------------------.
p <- ggplot() +
  geom_sf(data = all_streets$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          linewidth = .4,
          alpha = .8) +
  geom_sf(data = railway$osm_lines,
          inherit.aes = FALSE,
          color = "black",
          linewidth = .2,
          alpha = .6) +
  coord_sf(xlim = c(-0.43, -0.335), 
           ylim = c(39.43, 39.5025),
           expand = FALSE) +
  theme_void() + 
  geom_segment(aes(x = -0.43, y = 39.43, xend = -0.335, yend = 39.43), size = 3) + # bottom
  geom_segment(aes(x = -0.43, y = 39.5025, xend = -0.335, yend = 39.5025), size = 3) + # top
  geom_segment(aes(x = -0.43, y = 39.43, xend = -0.43, yend = 39.5025), size = 3) + # left
  geom_segment(aes(x = -0.335, y = 39.43, xend = -0.335, yend = 39.5025), size = 3) # right

ggsave(filename = "plots/valencia-3.png", p, width = 888, height = 877, units = "mm")

library(magick)
library(ggimage)

d <- image_read(path = "plots/valencia-3.png")

d %>% image_frame(color = "black")


pp <- p + theme(plot.margin=grid::unit(c(2,2,2,2), "mm"))
ggsave(filename = "../Desktop/valencia-4.png", pp)


# Other ####

border <- ggplot() + 
  geom_segment(aes(x = 0, xend = 5, y = 0, yend = 0), size = 3) + 
  geom_segment(aes(x = 0, xend = 5, y = 10, yend = 10), size = 3) + 
  geom_segment(aes(x = 0, xend = 0, y = 0, yend = 10), size = 3) + 
  geom_segment(aes(x = 5, xend = 5, y = 0, yend = 10), size = 3) 
  # theme_void() + 
  annotation_custom(grob = ggplotGrob(plot))
plot <- p + theme(plot.margin=grid::unit(c(1,1,1,1), "mm"))


ggdraw(border) + 
  draw_plot(pp, width = .7, x = 0, y = 0)


ggplot() + 
  geom_segment(aes(x = 0, xend = 5, y = 0, yend = 0), size = 3) + 
  geom_segment(aes(x = 0, xend = 5, y = 10, yend = 10), size = 3) + 
  geom_segment(aes(x = 0, xend = 0, y = 0, yend = 10), size = 3) + 
  geom_segment(aes(x = 5, xend = 5, y = 0, yend = 10), size = 3) +
# theme_void() + 
annotation_custom(grob = ggplotGrob(plot), 
                  xmin = 0.5, 
                  xmax = 4.5, 
                  ymax = 9.5, 
                  ymin = 6.5)



# cowplot
ggdraw(xlim = c(0, 5), ylim = c(0, 10)) + 
  draw_plot(border, x = 0, y = 0, width = 5, height = 10) + 
  draw_plot(plot, x = 0, width = 5, y = 4, height = 4)
