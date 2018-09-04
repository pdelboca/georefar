#' Obtener Ubicacion
#'
#' @param lat numeric Latitud del punto, en forma de número real con grados decimales.
#' @param lon numeric Longitud del punto, en forma de número real con grados decimales.
#' @param aplanar boolean Cuando está presente, muestra el resultado JSON con una estructura plana.
#' @param campos text Campos a incluir en la respuesta separados por comas, sin espacios. Algunos campos siempre serán incluidos, incluso si no se agregaron en la lista. Para incluir campos de sub-entidades, separar los nombres con un punto, por ejemplo: provincia.id.
#'
#' @importFrom purrr compact
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET, content
#' @export
#' @rdname get_ubicacion
#'
#' @return Un Data Frame con el listado de Departamentos
#' @examples
#' \dontrun{
#' get_ubicacion()
#' }

get_ubicacion <- function(lat, lon, aplanar = TRUE, campos = NULL){
  args <- list(lat = lat, lon = lon, aplanar = aplanar, campos = campos)

  check_internet()

  base_url_get_ubicacion <- paste0(base_url, "ubicacion")
  res <- GET(base_url_get_ubicacion, query = compact(args))

  check_status(res)

  as.data.frame( fromJSON(content(res, "text"))$ubicacion)
}
