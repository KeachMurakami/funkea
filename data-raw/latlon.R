hitsujigaoka <- c(43.009502, 141.407926)
memuro <- c(42.889113, 143.074786)


hro_tokachi <- c(42.891835, 143.078748)
hro_kitami <- c(43.748747, 143.720565)
hro_naganuma <- c(43.054975, 141.755595)
hro_hokuto <- c(41.886521, 140.653990)
hro_kamikawa <- c(43.859420, 142.481695)
hro_takikawa <- c(43.585444, 141.985152)

mymap <-
  tibble::lst(hitsujigaoka,
              memuro)

usethis::use_data(mymap, overwrite = TRUE)
