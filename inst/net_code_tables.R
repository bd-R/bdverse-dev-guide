# Code Network + Pkg Tables -----------------
# !!! To create normal functions + documentation!!!!

code_net <- function(repo = NULL,
                     direction = "DU") {

library(pkgnet)
library(visNetwork)
library(magrittr)

pkg_name = basename(repo)

pkgnet:::silence_logger()
funcReporter <- pkgnet::FunctionReporter$new()
funcReporter$layout_type <- "layout_as_tree"
funcReporter$set_package(
  pkg_name = pkg_name,
)



edges <- as.data.frame(funcReporter$graph_viz$x$edges)
nodes <- as.data.frame(funcReporter$graph_viz$x$nodes)

edges$shadow <- TRUE
edges$arrows <- "from"
edges$color <- "#598392"

nodes$shadow <- TRUE
nodes$color <- NULL
nodes$'Function Name' <- nodes$node
nodes$isExported <- ifelse(nodes$isExported == TRUE, "Yes", "No")

nodes$functionCode <- 
  unlist(lapply(nodes$label,
                function(x) {
                  githubinstall::gh_show_source(func = x,
                                                repo = repo)
                }
  )
  )


nodes$functionTitle <- 
  unlist(lapply(nodes$label,
                function(x) {
                  rd_gh_path <- paste0(
                    "https://raw.githubusercontent.com/",
                    repo, "/dev/man/", x,".Rd")
                  tryCatch({
                    # This is what happens if there's no error:
                    rd_file <- tools::parse_Rd(rd_gh_path)
                    tags <- tools:::RdTags(rd_file)
                    title_text <- 
                      rd_file[[which(tags == "\\title")]][1][[1]][1]
                  }, error = function(e) {
                    # But if an error occurs, value is NULL:
                    NA
                  }
                  )
                }
  )
  )


nodes$functionDescription <- 
  unlist(lapply(nodes$label,
                function(x) {
                  rd_gh_path <- paste0(
                    "https://raw.githubusercontent.com/",
                    repo, "/dev/man/", x,".Rd")
                  tryCatch({
                    # This is what happens if there's no error:
                    rd_file <- tools::parse_Rd(rd_gh_path)
                    tags <- tools:::RdTags(rd_file)
                    title_text <- 
                      rd_file[[which(tags == "\\description")]][2][[1]][1]
                  }, error = function(e) {
                    # But if an error occurs, value is NULL:
                    NA
                  }
                  )
                }
  )
  )


nodes$title <- paste0("<p>",
                      "<b>",nodes$label, "</b>",
                      "<br><b>Title</b>: ", nodes$functionTitle,
                      "<br><b>Description</b>: ", nodes$functionDescription,
                      "<br><b>Exported</b>: ", nodes$isExported,
                      "<br><a href=", nodes$functionCode, '">Function Code</a>',
                      "</p>")

bdverse_core_pkgs <- bdutilities::bdverse_core_pkgs
pkg_color <- bdverse_core_pkgs[bdverse_core_pkgs$pkg_name == pkg_name,"pkg_color"]

fun_graph <- 
  visNetwork(nodes, edges, width = "100%") %>% 
    visNodes(shape = "dot", 
             color = list(background = "#7b9db7", 
                          border = "#01161e",
                          highlight = pkg_color,
                          hover = pkg_color),
             font = list(size = "16", 
                         face = "tahoma",
                         background ="rgba(255,254,249,0.62)")) %>%
    visEdges(color = list(color = "#255b59",
                          hover = "#255b59",
                          highlight = "#162e33",
                          inherit = FALSE)) %>%
    visOptions(highlightNearest = list(enabled = T, degree = 2, hover = T),
               selectedBy = list(variable = 'Function Name',
                                 style = 'width: 200px;
                                          height: 26px;
                                          background: #f8f8f8;
                                          color: #;
                                          border:none;
                                          outline:none;')) %>%
    visHierarchicalLayout(direction = direction) %>%
    visLayout(randomSeed = 12) # to always have the same network


# Table
nodes$linkToCode <- paste0('<a href="', nodes$functionCode, '">Function Code</a>')
  
fun_tbl <-
  dplyr::select(nodes,
                'Function Name',functionTitle,functionDescription,
                isExported, linkToCode)

names(fun_tbl) <- qdapRegex::TC(snakecase::to_snake_case(names(fun_tbl),
                                                         sep_out = " "))

fun_tbl <- 
  fun_tbl %>% DT::datatable(escape = FALSE, options = list("pageLength" = 20))

results <- list(fun_graph, fun_tbl)
return(results)

}