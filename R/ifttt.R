#' Convert itfff time to ymd-hm
#'
#' @param chr time in ifttt format
#'
#' @export
convert_ifttt_time <-
  function(chr){
    stringr::str_split(chr, pattern = " ") %>%
      map_chr(function(txt){
        date <- paste0(txt[3], "-", txt[1], "-", txt[2])
        is_am <- str_detect(txt[5], "AM")
        hour <- as.numeric(stringr::str_sub(txt[5], 1, 2)) + dplyr::if_else(is_am, 0, 9)
        minute <- stringr::str_sub(txt[5], 4, 5)

        as.character(lubridate::ymd_hm(paste0(date, " ", hour, ":", minute)))
      })
  }
