#' Write only files that are not available
#'
#' @param write_fun file-write function
#' @param x object to be written
#' @param file filename
#' @export
write_missing_files <-
  function(write_fun, x, file, ..., msg = c("skip:", "written:")){
    if(file.exists(file)){
      usethis::ui_info(paste(msg[1], Sys.time()))
    } else {
      write_fun(x, file, ...)
      usethis::ui_info(paste(msg[2], Sys.time()))
    }
  }
