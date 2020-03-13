#' Plot unicodes
#'
#' @export
see_unicode <-
  function(){

    to_show <-
      tibble::tribble(
        ~ chr,          ~ unicode,      ~ symbol,
        "mu",           "u03BC",        "\u03BC",
        "plus-minus",   "u00B1",        "\u00B1",
        "delta",        "u2206",        "\u2206",
        "times",        "u00D7",        "\u00D7",
        "deg",          "u00B0",        "\u00B0"
      ) %>%
      tibble::rowid_to_column("v") %>%
      mutate(unicode = paste0(" = ", unicode))

    ggplot(to_show, aes(x = 1, y = v)) +
      theme_void(base_family = "Arial") +
      geom_text(hjust = 1, aes(label = symbol)) +
      geom_text(hjust = 0, aes(label = unicode))
  }


#' Generate ggplot2 labels
#'
#' @export
gglabel <-
  function(text, type = "degC"){
    if(type == "degC"){
      bquote(.(text)~"[\u00B0C]")
    } else if(type == "muconc") {
      bquote(.(text)~"[\u03BCmol"~mol^-1*"]")
    } else if(type == "muflux"){
      bquote(.(text)~"[\u03BCmol"~m^-2~s^-1*"]")
    }
  }
