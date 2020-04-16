#' Turn ticks inward
#'
#' @export
inward_tick <-
  function(length = 2, unit = "mm"){
    list(
      theme(axis.ticks.length = unit(-length, unit),
            axis.ticks        = element_line(size = rel(.5)),
            axis.text.x       = element_text(margin = unit(c(2*length, 0, 0, 0), units = unit)),
            axis.text.y       = element_text(margin = unit(c(0, 2*length, 0, 0), units = unit)))
    )
  }

#' legend position
#'
#' @export
legend_topright <-
  function(position = c(.95, .95)){
    list(
      theme(legend.position      = position,
            legend.justification = c(1, 1))
    )
  }

#' legend position
#'
#' @export
legend_topleft <-
  function(position = c(.05, .95)){
    list(
      theme(legend.position      = position,
            legend.justification = c(0, 1))
    )
  }

#' legend position
#'
#' @export
legend_bottomright <-
  function(position = c(.95, .05)){
    list(
      theme(legend.position      = position,
            legend.justification = c(1, 0))
    )
  }

#' legend position
#'
#' @export
legend_bottomleft <-
  function(position = c(.05, .05)){
    list(
      theme(legend.position      = position,
            legend.justification = c(0, 0))
    )
  }


#' Transparent backgrounds
#'
#' @export
transparent <-
  theme(legend.background = element_blank(),
        panel.background  = element_blank(),
        plot.background   = element_blank(),
        strip.background  = element_blank())

#' Use Japanese font
#'
#' @export
jpn <-
  theme(text = element_text(family = "HiraKakuPro-W3"))

#' ggplot theme
#'
#' @export
theme_funkea <-
  function(size = 11, tick_length = 2, use_japanese = TRUE){
    if(use_japanese){
      list(
        theme_bw(base_size = size),
        inward_tick(length = tick_length),
        transparent,
        jpn
      )
    } else {
      list(
        theme_bw(base_size = size),
        inward_tick(length = tick_length),
        transparent
      )
    }
  }

