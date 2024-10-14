render_lecture <- function(x, purl = FALSE){
  input_paths <-  sort(list.files("./_lectures/", 
                                  pattern = paste0("slides.*", x, ".*Rmd$"), 
                                  recursive = TRUE, 
                                  full.names = TRUE))
  r_out_paths <-  stringr::str_remove(input_paths, "md$")
  unlink(r_out_paths, recursive = FALSE)
  if(purl){
    purrr::walk2(.x = input_paths, .y = r_out_paths, 
                 ~ knitr::purl(.x, output = .y, documentation = 0))
  }
  purrr::walk(.x = input_paths, ~rmarkdown::render(.x, encoding = "UTF-8"))
}
render_lecture("questions")
render_lecture("relationships")
render_lecture("inference")
render_lecture("causality")
render_lecture("writing")
render_lecture("critiquing")

