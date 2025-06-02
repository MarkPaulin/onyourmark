#' Create a new project
#'
#' @param path Path to directory for new project
#' @param type Either `"package"` (default) for a standard package, or one of
#' `"pipeline"` or `"shinyapp"`, which have a `run.R` file.
#' @param cph Copyright holder, defaults to "Crown Copyright" for work
#' @export
create_project <- function(path,
                           type = c("package", "pipeline", "shinyapp"),
                           cph = "Crown Copyright") {
  type <- match.arg(type)
  usethis::create_package(path, open = FALSE)
  usethis::with_project(path, {
    usethis::use_readme_rmd(open = FALSE)
    usethis::use_testthat()
    usethis::use_package_doc(open = FALSE)
    usethis::use_package("R", "Depends", "4.1")
    usethis::use_package("pkgload", "Suggests")
    usethis::use_mit_license(copyright_holder = cph)

    if (type == "shinyapp") {
      usethis::use_package("shiny")
      usethis::use_template(
        "run_app.R",
        save_as = "run.R",
        data = list(app_name = fs::path_file(path)),
        open = FALSE,
        package = "onyourmark"
      )

      usethis::use_template(
        "app.R",
        save_as = "R/app.R",
        data = list(app_name = fs::path_file(path)),
        open = FALSE,
        package = "onyourmark"
      )

      usethis::use_build_ignore("run.R")
    }

    if (type == "pipeline") {
      usethis::use_template(
        "run_pipeline.R",
        save_as = "run.R",
        open = FALSE,
        package = "onyourmark"
      )

      usethis::use_template(
        "main.R",
        save_as = "R/main.R",
        open = FALSE,
        package = "onyourmark"
      )

      usethis::use_template(
        "config.yml",
        save_as = "config.yml",
        open = FALSE,
        package = "onyourmark"
      )

      usethis::use_package("yaml", "Suggests")
      usethis::use_build_ignore(c("run.R", "config.yml"))
    }

    usethis::use_git()
  })
}
