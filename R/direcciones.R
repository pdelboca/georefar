#' Normalizacion de direcciones
#'
#' @param direccion text Requerido. Direccion a normalizar, debe contener altura separada por espacio. (Ej: Colon 127)
#' @param tipo text Tipo de calle. (Valores disponibles: calle, avenida, pasaje.)
#' @param provincia text Filtrar por nombre o ID de provincia.
#' @param departamento text Filtrar por nombre o ID de departamento.
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
#' @rdname normalizar_direccion
#'
#' @return Un Data Frame con el listado normalizado de de direcciones
#' @examples
#' \dontrun{
#' normalizar_direccion()
#' }

normalizar_direccion <- function(direccion, tipo = NULL, provincia = NULL, departamento = NULL, aplanar = TRUE, campos = NULL, max = NULL, exacto = NULL){
  args <- list(direccion = direccion, tipo = tipo, provincia = provincia, departamento = departamento, aplanar = aplanar, campos = campos, max = max, exacto = exacto)

  check_internet()
  base_url_get_direcciones <- paste0(base_url, "direcciones")
  res <- GET(base_url_get_direcciones, query = compact(args))

  check_status(res)

   fromJSON(content(res, "text"))$direcciones
}

