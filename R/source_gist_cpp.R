#' list all snipetts from Gist
#'
#' @export
source_gist <-
  function(fun = NULL, user = "KeachMurakami", ext = "cpp"){
    gist_url <- "https://gist.github.com/"
    links <-
      rvest::read_html(paste0(gist_url, user)) |>
      rvest::html_nodes("a")

    cpp_links <- links[sapply(links, function(x) length(rvest::html_nodes(x, "strong")) > 0)]

    cpp_urls <-
      paste0(gist_url, rvest::html_attr(cpp_links, "href"))


    if(is.null(fun)){

      is_cpp <- rvest::html_text(cpp_links) |> stringr::str_detect(ext)
      opts <- rvest::html_text(cpp_links)[is_cpp]

      cat("options:\n")
      for (i in 1:length(opts)) {
        cat(i, "-", opts[i], "\n")
      }

      choice <- as.integer(readline(prompt = "select one function: "))
      cpp_url <- cpp_urls[is_cpp][choice]

    } else {

      funs <- rvest::html_text(cpp_links)
      fn <- which(stringr::str_detect(funs, fun))

      cpp_url <- cpp_urls[which(stringr::str_detect(funs, fun))]
      cat("load ", funs[fn], "\n")

    }

    url <-
      cpp_url |>
      rvest::read_html() |>
      rvest::html_nodes("a") |>
      rvest::html_attr("href") |>
      stringr::str_subset("raw")

    gist_file <- paste0(tempdir(), "/source.cpp")
    utils::download.file(url = paste0(gist_url, url), destfile = gist_file)
    Rcpp::sourceCpp(gist_file)
  }
