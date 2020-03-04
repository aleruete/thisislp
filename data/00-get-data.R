library(Rspotify)
library(tidyverse)

keys <- spotifyOAuth(Sys.getenv("spotify_app"), Sys.getenv("spotify_id"), Sys.getenv("spotify_secret"))

# lp_spotify <- searchArtist("LP", token = keys)

lp_post_2014 <- getArtist("0J7U24vlOOIeMpuaO6Q85A", token = keys)
lp_pre_2014 <- getArtist("0PzKCRBaQ5fCALoi4zSKQk", token = keys)

lp_post_2014 %>% 
  bind_rows(lp_pre_2014) %>% 
  summarise(
    popularity = max(popularity),
    followers = sum(followers)
  )

# albums ----

lp_albums_post_2014 <- getAlbums("0J7U24vlOOIeMpuaO6Q85A", token = keys)
lp_albums_pre_2014 <- getAlbums("0PzKCRBaQ5fCALoi4zSKQk", token = keys)

lp_albums_post_2014_2 <- map_df(1:nrow(lp_albums_post_2014), 
                                function(x) {
                                  getAlbum(lp_albums_post_2014$id[x], token = keys) %>% 
                                    mutate(album = lp_albums_post_2014$name[x])
                                  })

lp_albums_pre_2014_2 <- map_df(1:nrow(lp_albums_pre_2014), 
                                function(x) {
                                  getAlbum(lp_albums_pre_2014$id[x], token = keys) %>% 
                                    mutate(album = lp_albums_pre_2014$name[x])
                                })

# songs ----

lp_songs_post_2014 <- map_df(1:nrow(lp_albums_post_2014_2), 
                               function(x) {
                                 getTrack(lp_albums_post_2014_2$id[x], token = keys)
                               })

lp_songs_pre_2014 <- map_df(1:nrow(lp_albums_pre_2014_2), 
                              function(x) {
                                getTrack(lp_albums_pre_2014_2$id[x], token = keys)
                              })

lp_songs_post_2014_2 <- map_df(1:nrow(lp_albums_post_2014_2), 
                                function(x) {
                                  getFeatures(lp_albums_post_2014_2$id[x], token = keys)
                                })

lp_songs_pre_2014_2 <- map_df(1:nrow(lp_albums_pre_2014_2), 
                               function(x) {
                                 getFeatures(lp_albums_pre_2014_2$id[x], token = keys)
                               })

# join songs ----

lp_songs_post_2014_3 <- lp_songs_post_2014 %>% 
  left_join(lp_songs_post_2014_2, by = c("track_id" = "id")) %>% 
  select(matches("album"), everything())

lp_songs_pre_2014_3 <- lp_songs_pre_2014 %>% 
  left_join(lp_songs_pre_2014_2, by = c("track_id" = "id")) %>% 
  select(matches("album"), everything())

# join songs with albums ----

lp_albums_post_2014_3 <- lp_albums_post_2014_2 %>% 
  mutate(name = as.character(name), id = as.character(id)) %>% 
  left_join(lp_songs_post_2014_3 %>% mutate(name = as.character(name)), by = c("album", "name", "id" = "track_id")) %>% 
  select(album, album_id, name, everything())

lp_albums_pre_2014_3 <- lp_albums_pre_2014_2 %>% 
  mutate(name = as.character(name), id = as.character(id)) %>% 
  left_join(lp_songs_pre_2014_3 %>% mutate(name = as.character(name)), by = c("album", "name", "id" = "track_id")) %>% 
  select(album, album_id, name, everything()) %>% 
  distinct(name, .keep_all = TRUE)

lp_albums <- lp_albums_post_2014_3 %>% 
  bind_rows(lp_albums_pre_2014_3) %>% 
  select(album, name, duration_ms = duration_ms.x, track_number, disc_number, explicit, popularity, danceability:tempo) %>% 
  as_tibble()

saveRDS(lp_albums, file = "data/lp_albums.rds")

# related ----

countries <- countrycode::codelist_panel %>% filter(year == 2007) %>% select(iso2c) %>% drop_na() %>% pull()

lp_top <- map_df(countries,
                 function(c) { 
                   Rspotify::getTopTracks("0J7U24vlOOIeMpuaO6Q85A", country = c, token = keys) %>% 
                     mutate(country = c)
                  }
)

lp_top <- lp_top %>% 
  select(-c(available_markets, duration_ms, track_number, artist_id))

saveRDS(lp_top, file = "data/lp_top.rds")
