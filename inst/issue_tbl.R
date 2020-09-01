#' Create a package issue table
#'
#' \code{issue_tbl} returns a GitHub issue table (\code{D}T object) for a specific 
#' GitHub repository. Issues are filtered for open GitHub issues with specific labels.
#' @param pkg_name package name to use in gitHub API for getting the issues
#' format: \code{pkg_name ="owner/repo"}
#' @param labels labels name to use in gitHub API for filtering the issues
#' format: \code{labels ="labels=bug"}, for excluding a label use:
#' \code{labels ="-labels=bug"}, for multiple words labels use \code{%20} 
#' for space: \code{labels ="labels=help%20wanted"}
#' 
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#' @importFrom DT datatable
#' @importFrom magrittr "%<>%"
#' 
#' @export
issue_tbl <- function(pkg_name = NULL,
                      labels = NULL) {
  
    issues_url <- 
    sprintf("https://api.github.com/repos/%s/issues?state=open&%s",
                        pkg_name,
                        labels)
  tryCatch(
    # This is what happens if there's no error .
    {
      download_issues <- jsonlite::fromJSON(issues_url)
      
      issue_tbl <- 
        tibble::tibble(
          'Issue Title' = paste0("<a href=", download_issues$html_url, ">",
                                 download_issues$title, "</a>"),
          Body = download_issues$body
        ) %>% DT::datatable(escape = FALSE,
                            options = list(
                              autowidth = FALSE,
                              columnDefs = list(list(width = '350px', targets = c(1))),
                              pageLength = 20,
                              scrollX = TRUE,
                              fixedColumns = TRUE
                            ))
      return(issue_tbl)
    },
    # But if an error occurs, no issue was found: 
    error=function(error_message) {
      issue_tbl_error <- 
        tibble::tibble(
          'Issue Title' = "Sorry, but no issues were found matching input criteria"
          ) %>% DT::datatable(escape = FALSE)
      return(issue_tbl_error)
    }
  )
}