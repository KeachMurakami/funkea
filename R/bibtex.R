#' @export
#' @importFrom rlang .data
update_bib <-
  function(bib_directory = "~/Dropbox/r_packages/fudukue/bibtex/list_bib/",
           output_dir = "~/Dropbox/r_packages/fudukue/bibtex/"){
    if(length(dir(bib_directory)) == 0){
      stop("Folder may not exist.")
    } else {
      system(paste0("cat ", bib_directory, "*.bib > ", output_dir, "full_with.bib"))
      system(paste0("cat ", output_dir, "*with.bib > ", output_dir, "With.bib"))

      system(paste0("mv ", output_dir, "full_with.bib ", output_dir, "full_without.bib"))
      system(paste0("cat ", output_dir, "*without.bib > ", output_dir, "Without.bib"))

      system(paste0("mv ", output_dir, "full_without.bib ", output_dir, "tempFull.bib"))
      system(paste0("cat ", output_dir, "*Full.bib > ", output_dir, "Full.bib"))
      system(paste0("rm ", output_dir, "tempFull.bib"))
    }
    cat("\nCitations have been updated.\n\n")
  }

#' @export
#' @importFrom rlang .data
update_abbrv <-
  function(abbrv_file = "~/Dropbox/r_packages/fudukue/bibtex/MyAbbrvList.csv"){
    abbrv_dir <- dirname(abbrv_file)
    abbrv_data <-
      dplyr::mutate(utils::read.csv(abbrv_file),
                    Full = paste0('@string{', .data$Abbrv, '=\"', .data$Full, '\"}'),
                    With = paste0('@string{', .data$Abbrv, '=\"', .data$Abbrv_with_period, '\"}'),
                    Without = paste0('@string{', .data$Abbrv, '=\"', .data$Abbrv_without_period, '\"}'))

    write(abbrv_data$Full,    file = paste0(abbrv_dir, "/abbrev_Full.bib"))
    write(abbrv_data$With,    file = paste0(abbrv_dir, "/abbrev_with.bib"))
    write(abbrv_data$Without, file = paste0(abbrv_dir, "/abbrev_without.bib"))

    cat("\nAbbreviations have been updated.\n\n")
  }


#' @export
update_cite <-
  function(...){
    update_abbrv(...)
    update_bib(...)
  }
