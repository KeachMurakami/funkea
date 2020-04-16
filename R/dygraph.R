#' Quick dygraph (experimental)
#'
#' @export
dy <-
  function(data, time_index){
    library(xts)
    xts_data <- xts::xts(x = data[, -time_index], order.by = data[, time_index, drop = TRUE])
    dygraphs::dygraph(xts_data)
  }
