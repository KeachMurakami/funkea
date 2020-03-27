#' Add leading zero
#'
#' @param x a vector of integer
#' @param digits number digits after zero padding
#' @param fill chracter for padding
#' @export
lead_zero <-
  function(x, digits = 2, fill = "0"){
    x <- stringr::str_pad(string = x, width = digits, pad = fill, side = "left")
    return(x)
  }

#' Add tailing zero
#'
#' @param x a vector of numeric
#' @param digits number of decimal digits
#' @export
tail_zero <-
  function(x, digits = 2){
    formatting <- paste0("%.", digits, "f")
    x <- sprintf(formatting, round(x, digits))
    x <- dplyr::if_else(x == "NA", NA_character_, as.character(x))
    return(x)
  }
