#' Kick notifier
#'
#' In MacOS, use terminal-notifier
#' In Windows, to be implemented
#'
#' @export
tellme <-
  function(msg = "Finished"){

    if(.Platform$OS.type == "unix"){
      system(str_glue("terminal-notifier -title Rstudio -message {msg} -appIcon /Users/keach/RStudio-Logo-Flat.png"))
    } else {
      usethis::ui_oops("Not available on Windows")
    }
  }

