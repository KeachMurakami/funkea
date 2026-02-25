#' @export
#' @importFrom rlang .data
update_bib <-
  function(
    bib_directory = "~/Dropbox/Publish/bibtex/list_bib/",
    output_dir = "~/Dropbox/Publish/bibtex/"
  ) {
    if (length(dir(bib_directory)) == 0) {
      stop("Folder may not exist.")
    } else {
      tmp <- tempdir()

      # Step 1: list_bib/ の全bibを結合
      system(paste0("cat ", bib_directory, "*.bib > ", tmp, "/full_base.bib"))

      # Step 2: With.bib = full_base + abbrev_with
      system(paste0(
        "cat ",
        tmp,
        "/full_base.bib ",
        output_dir,
        "abbrev_with.bib > ",
        tmp,
        "/With.bib"
      ))

      # Step 3: Without.bib = full_base + abbrev_without
      system(paste0(
        "cat ",
        tmp,
        "/full_base.bib ",
        output_dir,
        "abbrev_without.bib > ",
        tmp,
        "/Without.bib"
      ))

      # Step 4: Full.bib = full_base + abbrev_Full
      system(paste0(
        "cat ",
        tmp,
        "/full_base.bib ",
        output_dir,
        "abbrev_Full.bib > ",
        tmp,
        "/Full.bib"
      ))

      # 一括コピー
      file.copy(
        file.path(tmp, "With.bib"),
        file.path(output_dir, "With.bib"),
        overwrite = TRUE
      )
      file.copy(
        file.path(tmp, "Without.bib"),
        file.path(output_dir, "Without.bib"),
        overwrite = TRUE
      )
      file.copy(
        file.path(tmp, "Full.bib"),
        file.path(output_dir, "Full.bib"),
        overwrite = TRUE
      )
    }
    cat("\nCitations have been updated.\n\n")
  }

#' @export
#' @importFrom rlang .data
update_abbrv <-
  function(abbrv_file = "~/Dropbox/Publish/bibtex/MyAbbrvList.csv") {
    abbrv_dir <- dirname(abbrv_file)
    abbrv_data <-
      dplyr::mutate(
        utils::read.csv(abbrv_file),
        Full = paste0('@string{', .data$Abbrv, '=\"', .data$Full, '\"}'),
        With = paste0(
          '@string{',
          .data$Abbrv,
          '=\"',
          .data$Abbrv_with_period,
          '\"}'
        ),
        Without = paste0(
          '@string{',
          .data$Abbrv,
          '=\"',
          .data$Abbrv_without_period,
          '\"}'
        )
      )

    write(abbrv_data$Full, file = paste0(abbrv_dir, "/abbrev_Full.bib"))
    write(abbrv_data$With, file = paste0(abbrv_dir, "/abbrev_with.bib"))
    write(abbrv_data$Without, file = paste0(abbrv_dir, "/abbrev_without.bib"))

    cat("\nAbbreviations have been updated.\n\n")
  }


#' @export
update_cite <-
  function(...) {
    update_abbrv(...)
    update_bib(...)
  }
