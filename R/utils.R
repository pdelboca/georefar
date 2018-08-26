#' @importFrom attempt stop_if_not
#' @importFrom curl has_internet
check_internet <- function(){
  stop_if_not(.x = has_internet(), msg = "No se detecto acceso a internet. Por favor checkea tu conexion.")
}

#' @importFrom httr status_code
check_status <- function(res){
  stop_if_not(.x = status_code(res),
              .p = ~ .x == 200,
              msg = "La API retorno un error.")
}

base_url <- "http://apis.datos.gob.ar/georef/api/"
