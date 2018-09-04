#' Obtener Provincias
#'
#' @param id text Filtrar por ID.
#' @param nombre text Filtrar por Nombre.
#' @param orden text Campo por el cual ordenar los resultados. (Por ID o nombre)
#' @param aplanar boolean Cuando está presente, muestra el resultado JSON con una estructura plana.
#' @param campos text Campos a incluir en la respuesta separados por comas, sin espacios. Algunos campos siempre serán incluidos, incluso si no se agregaron en la lista. Para incluir campos de sub-entidades, separar los nombres con un punto, por ejemplo: provincia.id.
#' @param max integer Cantidad máxima de resultados a devolver.
#' @param exacto boolean Cuando está presente, se activa el modo de búsqueda por texto exacto. Sólo tiene efecto cuando se usan campos de búsqueda por texto (por ejemplo, nombre).
#'
#' @importFrom attempt stop_if_all
#' @importFrom purrr compact
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content
#' @export
#' @rdname get_provincias
#'
#' @return Un Data Frame con el listado de Provincias
#' @examples
#' \dontrun{
#' get_provincias(nombre = "Córdoba")
#' }

get_provincias <- function(id = NULL, nombre = NULL, orden = NULL, aplanar = TRUE, campos = NULL, max = NULL, exacto = NULL){
  args <- list(id = id, nombre = nombre, orden = orden, aplanar = aplanar, campos = campos, max = max, exacto = exacto)
  #stop_if_all(args, is.null, "You need to specify at least one argument")

  check_internet()
  base_url_get_provincias <- paste0(base_url, "provincias")
  res <- GET(base_url_get_provincias, query = compact(args))

  check_status(res)

   fromJSON(content(res, "text"))$provincias
}
