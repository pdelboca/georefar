
<!-- README.md is generated from README.Rmd. Please edit that file -->
georefar
========

Importante: este paquete ha sido archivado y no está siendo mantenido. Toda la funcionalidad ha sido integrada en el paquete [geoAr](https://github.com/PoliticaArgentina/geoAr/) y todo futuro desarrollo será realizado en dicho paquete. Se recomienda migrar todas los usos de este paquete a su nueva version: https://github.com/PoliticaArgentina/geoAr/#instalaci%C3%B3n-install

La API del paquete `georefar` __se ha mantenido en su totalidad__ al integrarse a `geoAr` por lo que el único cambio requerido en la migración es la dependencia (todos los métodos se mantuvieron al igual que su valor devuelto).

Cualquier problema, se puede reportar en el Issue Tracker de `geoAr`: https://github.com/PoliticaArgentina/geoAr/issues

Description
-----------

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

georefar es un paquete de R que implementa un wrapper para la API [georef-ar](https://georef-ar-api.readthedocs.io/es/latest/).

La API del Servicio de Normalización de Datos Geográficos, permite normalizar y codificar los nombres de unidades territoriales de la Argentina (provincias, departamentos, municipios y localidades) y de sus calles, así como ubicar coordenadas dentro de ellas.

Instalación
-----------

Se puede instalar la version en desarrollo del paquete desde github:

``` r
# install.packages("devtools")
devtools::install_github("pdelboca/georefar")
```

Ejemplo de Usos
---------------

Para cargar la librería:

``` r
library(georefar)
```

Para obtener un listado de provincias:

``` r
get_provincias(orden = "id", max = 5)
#> No encoding supplied: defaulting to UTF-8.
#>   centroide_lat centroide_lon fuente id                          nombre
#> 1     -34.61449     -58.44586    IGN 02 Ciudad Autónoma de Buenos Aires
#> 2     -36.67694     -60.55883    IGN 06                    Buenos Aires
#> 3     -27.33583     -66.94768    IGN 10                       Catamarca
#> 4     -32.14293     -63.80175    IGN 14                         Córdoba
#> 5     -28.77430     -57.80122    IGN 18                      Corrientes
```

Para obtener un listado de departamentos:

``` r
get_departamentos(provincia = "Corrientes", orden = "id", max = 5)
#> No encoding supplied: defaulting to UTF-8.
#>   centroide_lat centroide_lon fuente    id           nombre provincia_id
#> 1     -28.49739     -58.93044    IGN 18007      Bella Vista           18
#> 2     -27.47797     -57.61138    IGN 18014 Berón de Astrada           18
#> 3     -27.52219     -58.76271    IGN 18021          Capital           18
#> 4     -28.40839     -58.03139    IGN 18028       Concepción           18
#> 5     -29.69552     -58.32484    IGN 18035    Curuzu Cuatia           18
#>   provincia_nombre
#> 1       Corrientes
#> 2       Corrientes
#> 3       Corrientes
#> 4       Corrientes
#> 5       Corrientes
```

Para obtener un listado de municipios:

``` r
get_municipios(provincia = "Santa Fe", max = 5)
#> No encoding supplied: defaulting to UTF-8.
#>   centroide_lat centroide_lon departamento_id departamento_nombre fuente
#> 1     -31.51617     -60.94975           82070        Las Colonias    IGN
#> 2     -30.77547     -61.26007           82021         Castellanos    IGN
#> 3     -31.68309     -61.40743           82070        Las Colonias    IGN
#> 4     -31.54899     -61.96037           82021         Castellanos    IGN
#> 5     -33.86683     -61.25141           82042       General López    IGN
#>       id        nombre provincia_id provincia_nombre
#> 1 823176  Pujato Norte           82         Santa Fe
#> 2 822301          Maua           82         Santa Fe
#> 3 823232   San Mariano           82         Santa Fe
#> 4 822406 Zenón Pereyra           82         Santa Fe
#> 5 822756   Wheelwright           82         Santa Fe
```

Para obtener un listado de localidades:

``` r
get_localidades(provincia = "Chubut", max = 5)
#> No encoding supplied: defaulting to UTF-8.
#>   centroide_lat centroide_lon departamento_id departamento_nombre fuente
#> 1     -42.57362     -64.28369           26007              Biedma  BAHRA
#> 2     -42.81159     -65.05142           26007              Biedma  BAHRA
#> 3     -42.06797     -71.52067           26014            Cushamen  BAHRA
#> 4     -42.05429     -71.16732           26014            Cushamen  BAHRA
#> 5     -42.23293     -71.36951           26014            Cushamen  BAHRA
#>            id municipio_id municipio_nombre            nombre provincia_id
#> 1 26007030000         <NA>             <NA>   PUERTO PIRAMIDE           26
#> 2 26007040000       260007    Puerto Madryn QUINTA EL MIRADOR           26
#> 3 26014040000       260021          El Hoyo           EL HOYO           26
#> 4 26014050000       260028        El Maitén         EL MAITEN           26
#> 5 26014060000       260035           Epuyén            EPUYEN           26
#>   provincia_nombre                  tipo
#> 1           Chubut Localidad simple (LS)
#> 2           Chubut Localidad simple (LS)
#> 3           Chubut Localidad simple (LS)
#> 4           Chubut Localidad simple (LS)
#> 5           Chubut Localidad simple (LS)
```

Para obtener la ubicacion de un punto (reverse-geocoding):

``` r
get_ubicacion(-31.6515236,-64.4358794)
#> No encoding supplied: defaulting to UTF-8.
#>   departamento_id departamento_nombre fuente       lat       lon
#> 1           14147         Santa María    IGN -31.65152 -64.43588
#>   municipio_id municipio_nombre provincia_id provincia_nombre
#> 1       141372      Alta Gracia           14          Córdoba
```

Para obtener detalles de una calle:

``` r
get_calles(max = 5)
#> No encoding supplied: defaulting to UTF-8.
#>   altura_fin_derecha altura_fin_izquierda altura_inicio_derecha
#> 1               1100                 3399                     0
#> 2               2600                21599                     0
#> 3               2599                 2700                   101
#> 4                  0                    0                     0
#> 5                  0                    0                     0
#>   altura_inicio_izquierda departamento_id departamento_nombre fuente
#> 1                       0           06028     Almirante Brown  INDEC
#> 2                       0           06028     Almirante Brown  INDEC
#> 3                       0           06434               Lanús  INDEC
#> 4                       0           06434               Lanús  INDEC
#> 5                       0           06028     Almirante Brown  INDEC
#>              id          nombre
#> 1 0602801005510      SAN MARTIN
#> 2 0602801002705 ERASMO OBLIGADO
#> 3 0643401001890        ONCATIVO
#> 4 0643401000030   20 DE OCTUBRE
#> 5 0602801001060       CALLE S N
#>                                     nomenclatura provincia_id
#> 1      SAN MARTIN, Almirante Brown, Buenos Aires           06
#> 2 ERASMO OBLIGADO, Almirante Brown, Buenos Aires           06
#> 3                  ONCATIVO, Lanús, Buenos Aires           06
#> 4             20 DE OCTUBRE, Lanús, Buenos Aires           06
#> 5       CALLE S N, Almirante Brown, Buenos Aires           06
#>   provincia_nombre  tipo
#> 1     Buenos Aires CALLE
#> 2     Buenos Aires CALLE
#> 3     Buenos Aires CALLE
#> 4     Buenos Aires CALLE
#> 5     Buenos Aires CALLE
```

Para normalizar una Direccion:

``` r
normalizar_direccion("Colon 127")
#> No encoding supplied: defaulting to UTF-8.
#>    altura departamento_id departamento_nombre fuente            id nombre
#> 1     127           06035          Avellaneda  INDEC 0603501001265  COLON
#> 2     127           06028     Almirante Brown  INDEC 0602801002130  COLON
#> 3     127           06749        San Fernando  INDEC 0674901000790  COLON
#> 4     127           06189     Coronel Dorrego  INDEC 0618903000265  COLON
#> 5     127           06260  Esteban Echeverría  INDEC 0626001001060  COLON
#> 6     127           06490     Lomas de Zamora  INDEC 0649001002195  COLON
#> 7     127           06693         Roque Pérez  INDEC 0669302000260  COLON
#> 8     127           06329   General Las Heras  INDEC 0632902000155  COLON
#> 9     127           82133                Vera  INDEC 8213301000195  COLON
#> 10    127           82056             Iriondo  INDEC 8205603000430  COLON
#>                                   nomenclatura provincia_id
#> 1          COLON 127, Avellaneda, Buenos Aires           06
#> 2     COLON 127, Almirante Brown, Buenos Aires           06
#> 3        COLON 127, San Fernando, Buenos Aires           06
#> 4     COLON 127, Coronel Dorrego, Buenos Aires           06
#> 5  COLON 127, Esteban Echeverría, Buenos Aires           06
#> 6     COLON 127, Lomas de Zamora, Buenos Aires           06
#> 7         COLON 127, Roque Pérez, Buenos Aires           06
#> 8   COLON 127, General Las Heras, Buenos Aires           06
#> 9                    COLON 127, Vera, Santa Fe           82
#> 10                COLON 127, Iriondo, Santa Fe           82
#>    provincia_nombre  tipo ubicacion_lat ubicacion_lon
#> 1      Buenos Aires CALLE            NA            NA
#> 2      Buenos Aires CALLE            NA            NA
#> 3      Buenos Aires CALLE     -34.42727     -58.55827
#> 4      Buenos Aires CALLE     -38.71478     -61.29496
#> 5      Buenos Aires CALLE            NA            NA
#> 6      Buenos Aires CALLE     -34.76709     -58.39388
#> 7      Buenos Aires CALLE            NA            NA
#> 8      Buenos Aires CALLE            NA            NA
#> 9          Santa Fe CALLE     -29.89522     -60.28269
#> 10         Santa Fe CALLE            NA            NA
```
