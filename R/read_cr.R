#' read function for Campbell logger
#'
#' @export
read_cr <-
  function(file, n_max = Inf, wide = TRUE, remove_quality_check = TRUE, remove_time_of_occurence = TRUE){
    # read colnames
    colname <- colnames(readr::read_csv(file, col_types = readr::cols(), n_max = 1, skip = 1))

    removed <- NULL

    # quality-control columns, dependent on the system designer
    if(remove_quality_check){
      removed <- c(removed, which(stringr::str_detect(colname, "Count|Flg|\\(|_N")))
    }

    # time of occurrence columns, dependent on the system designer
    if(remove_time_of_occurence){
      removed <- c(removed, which(stringr::str_detect(colname, "TMn|TMx")))
    }

    removed <- unique(removed)

    data <-
      readr::read_csv(file, skip = 4, n_max = n_max, col_types = readr::cols(), col_names = FALSE) |>
      rlang::set_names(colname) |>
      dplyr::select(-tidyselect::all_of(removed)) |>
      dplyr::distinct_all()

    if(!wide){
      data <-
        data |>
        tidyr::gather(variable, value, -TIMESTAMP, -RECORD) |>
        dplyr::mutate(value = as.numeric(value))
    }

    return(data)
  }
