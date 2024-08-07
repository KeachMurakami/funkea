#' Plot unicodes
#'
#' @importFrom rlang .data
#' @export
see_unicode <-
  function(nrow = 6){

    vars_unicode <-
      tibble::tribble(
        ~ chr,          ~ unicode,      ~ symbol,
        "alpha",        "u03B1",        "\u03B1",
        "beta",         "u03B2",        "\u03B2",
        "gamma",        "u03B3",        "\u03B3",
        "delta",        "u03B4",        "\u03B4",
        "theta",        "u03B8",        "\u03B8",
        "lambda",       "u03BB",        "\u03BB",
        "mu",           "u03BC",        "\u03BC",
        "phi",          "u03C6",        "\u03C6",
        "plus-minus",   "u00B1",        "\u00B1",
        "delta",        "u2206",        "\u2206",
        "times",        "u00D7",        "\u00D7",
        "deg",          "u00B0",        "\u00B0"
      ) |>
      tibble::rowid_to_column("ID")


    shown_unicodes <-
      dplyr::mutate(vars_unicode,
                    lab = paste0(.data$symbol, " = ", .data$unicode),
                    col = (.data$ID - 1) %/% nrow,
                    row = .data$ID - .data$col * nrow)

    ggplot2::ggplot(shown_unicodes, ggplot2::aes(x = col, y = -row, label = .data$lab)) +
      ggplot2::theme_void() +
      ggplot2::geom_text(hjust = 0) +
      ggplot2::xlim(c(-.5, max(shown_unicodes$col) + 1))
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
