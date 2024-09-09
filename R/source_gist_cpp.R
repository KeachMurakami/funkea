#' load Rcpp function from Gist
#'
#' @export
source_gist_cpp <-
  function(gist_url){
    gist_file <- paste0(tempdir(), "/source.cpp")
    utils::download.file(url = gist_url, destfile = gist_file)
    Rcpp::sourceCpp(gist_file)
  }
