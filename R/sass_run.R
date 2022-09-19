#' @description This function will run sass any folder or files and
#' create all the files in the specified folder
#' For this you have to install the dartsass from their main site for your OS.
#' You can even define the path variable through an environment variable sass_binary_path if for any reason you can
#' not install dart sass.
#' @param asset_input_path `string`: defining the folder name from where files need to be picked or you can set an environment variable called `sass_input_path`
#' @param asset_output_path `string`: defining the folder name or the file name where files need to be created or you can set an environment variable called `sass_output_path`
#' @examples sass_run(
#'     asset_input_path = "app/styles/",
#'     asset_output_path = "app/static/css/",
#'     compressed = TRUE,
#'     watch = FALSE
#' )
#' @return Binary: returns console output given by the binary file
#' @noRd
#' @export
sass_run <- function(
    asset_input_path,
    asset_output_path,
    compressed = FALSE,
    watch = FALSE
    ) {
  # check the environment value for the sass_gobinary_path
  sass_path <- Sys.getenv("sass_binary_path")
  if( nchar( sass_path ) == 0 ){
    sass_path <- "sass"
  }

  if(missing(asset_input_path)){
    sass_input_path <- Sys.getenv("sass_input_path")
    if(nchar(sass_input_path) == 0 ){
      stop("please provide a valid input path")
    }
  } else {
    sass_input_path <- asset_input_path
  }
  if(missing(asset_output_path)){
    sass_output_path <- Sys.getenv("sass_output_path")
    if(nchar(sass_output_path) == 0 ){
      stop("please provide a valid output path")
    }
  } else {
    sass_output_path <- asset_output_path
  }

  full_command <- sprintf(
    fmt = "%s %s:%s",
    sass_path,
    sass_input_path,
    sass_output_path
  )

  if( compressed ){
    full_command <- paste0(full_command, " -s compressed ")
  }

  if( watch ){
    full_command <- paste0(full_command, " -w ")
  }

  system(full_command)

}
