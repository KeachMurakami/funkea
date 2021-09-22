#' Turn ticks inward
#'
#' @export
inward_tick <-
  function(length = 2, unit = "mm"){
    list(
      ggplot2::theme(axis.ticks.length = grid::unit(-length, unit),
                     axis.ticks        = ggplot2::element_line(size = ggplot2::rel(.5)),
                     axis.text.x       = ggplot2::element_text(margin = grid::unit(c(2*length, 0, 0, 0), units = unit)),
                     axis.text.y       = ggplot2::element_text(margin = grid::unit(c(0, 2*length, 0, 0), units = unit)))
    )
  }

#' legend position
#'
#' @export
legend_topright <-
  function(position = c(.95, .95)){
    list(
      ggplot2::theme(legend.position      = position,
                     legend.justification = c(1, 1))
    )
  }

#' legend position
#'
#' @export
legend_topleft <-
  function(position = c(.05, .95)){
    list(
      ggplot2::theme(legend.position      = position,
                    legend.justification = c(0, 1))
    )
  }

#' legend position
#'
#' @export
legend_bottomright <-
  function(position = c(.95, .05)){
    list(
      ggplot2::theme(legend.position      = position,
                    legend.justification = c(1, 0))
    )
  }

#' legend position
#'
#' @export
legend_bottomleft <-
  function(position = c(.05, .05)){
    list(
      ggplot2::theme(legend.position      = position,
                     legend.justification = c(0, 0))
    )
  }


#' Transparent backgrounds
#'
#' @export
transparent <-
  ggplot2::theme(legend.background = ggplot2::element_blank(),
                 panel.background  = ggplot2::element_blank(),
                 plot.background   = ggplot2::element_blank(),
                 strip.background  = ggplot2::element_blank())

#' Use Japanese font
#'
#' @export
jpn <-
  ggplot2::theme(text = ggplot2::element_text(family = "HiraKakuPro-W3"))

#' ggplot theme
#'
#' @export
theme_funkea <-
  function(size = 11, tick_length = 2, use_japanese = TRUE){
    if(use_japanese){
      list(
        ggplot2::theme_bw(base_size = size),
        inward_tick(length = tick_length),
        transparent,
        jpn
      )
    } else {
      list(
        ggplot2::theme_bw(base_size = size),
        inward_tick(length = tick_length),
        transparent
      )
    }
  }

