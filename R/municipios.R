#' Obtener Municipios
#'
#' @param id text Filtrar por ID.
#' @param nombre text Filtrar por Nombre.
#' @param provincia text Filtrar por nombre o ID de Provincia.
#' @param departamento text Filtrar por nombre o ID de Departamento.
#' @param orden text Campo por el cual ordenar los resultados. (Por ID o nombre)
#' @param aplanar boolean Cuando está presente, muestra el resultado JSON con una estructura plana.
#' @param campos text Campos a incluir en la respuesta separados por comas, sin espacios. Algunos campos siempre serán incluidos, incluso si no se agregaron en la lista. Para incluir campos de sub-entidades, separar los nombres con un punto, por ejemplo: provincia.id.
#' @param max integer Cantidad máxima de resultados a devolver.
#' @param exacto boolean Cuando está presente, se activa el modo de búsqueda por texto exacto. Sólo tiene efecto cuando se usan campos de búsqueda por texto (por ejemplo, nombre).
#'
#' @importFrom purrr compact
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET
#' @export
#' @rdname get_municipios
#'
#' @return Un Data Frame con el listado de Departamentos
#' @examples
#' \dontrun{
#' get_municipios()
#' }

get_municipios <- function(id = NULL, nombre = NULL, provincia = NULL, departamento = NULL, orden = NULL, aplanar = TRUE, campos = NULL, max = NULL, exacto = NULL){
  args <- list(id = id, nombre = nombre, provincia = provincia, departamento = departamento, orden = orden, aplanar = aplanar, campos = campos, max = max, exacto = exacto)

  check_internet()

  base_url_get_municipios <- paste0(base_url, "municipios")
  res <- GET(base_url_get_municipios, query = compact(args))

  check_status(res)

  fromJSON(rawToChar(res$content))$municipios
}
