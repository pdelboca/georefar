
<!-- README.md is generated from README.Rmd. Please edit that file -->
georefar
========

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

Para obtener un listado de provincias:

``` r
library(georefar)

get_provincias(orden = "id", max = 5)
#>   centroide_lat centroide_lon fuente id                           nombre
#> 1     -34.61449     -58.44586    IGN 02 Ciudad AutÃ³noma de Buenos Aires
#> 2     -36.67694     -60.55883    IGN 06                     Buenos Aires
#> 3     -27.33583     -66.94768    IGN 10                        Catamarca
#> 4     -32.14293     -63.80175    IGN 14                         CÃ³rdoba
#> 5     -28.77430     -57.80122    IGN 18                       Corrientes
```

Para obtener un listado de departamentos:

``` r
library(georefar)

get_departamentos(provincia = "Corrientes", orden = "id", max = 5)
#>   centroide_lat centroide_lon fuente    id            nombre provincia_id
#> 1     -28.49739     -58.93044    IGN 18007       Bella Vista           18
#> 2     -27.47797     -57.61138    IGN 18014 BerÃ³n de Astrada           18
#> 3     -27.52219     -58.76271    IGN 18021           Capital           18
#> 4     -28.40839     -58.03139    IGN 18028       ConcepciÃ³n           18
#> 5     -29.69552     -58.32484    IGN 18035     Curuzu Cuatia           18
#>   provincia_nombre
#> 1       Corrientes
#> 2       Corrientes
#> 3       Corrientes
#> 4       Corrientes
#> 5       Corrientes
```

Para obtener un listado de municipios:

``` r
library(georefar)

get_municipios(provincia = "Santa Fe", max = 5)
#>   centroide_lat centroide_lon departamento_id departamento_nombre fuente
#> 1     -31.51617     -60.94975           82070        Las Colonias    IGN
#> 2     -30.77547     -61.26007           82021         Castellanos    IGN
#> 3     -31.68309     -61.40743           82070        Las Colonias    IGN
#> 4     -31.54899     -61.96037           82021         Castellanos    IGN
#> 5     -33.86683     -61.25141           82042      General LÃ³pez    IGN
#>       id         nombre provincia_id provincia_nombre
#> 1 823176   Pujato Norte           82         Santa Fe
#> 2 822301           Maua           82         Santa Fe
#> 3 823232    San Mariano           82         Santa Fe
#> 4 822406 ZenÃ³n Pereyra           82         Santa Fe
#> 5 822756    Wheelwright           82         Santa Fe
```

Para obtener un listado de localidades:

``` r
library(georefar)

get_localidades(provincia = "Chubut", max = 5)
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
#> 4 26014050000       260028       El MaitÃ©n         EL MAITEN           26
#> 5 26014060000       260035          EpuyÃ©n            EPUYEN           26
#>   provincia_nombre                  tipo
#> 1           Chubut Localidad simple (LS)
#> 2           Chubut Localidad simple (LS)
#> 3           Chubut Localidad simple (LS)
#> 4           Chubut Localidad simple (LS)
#> 5           Chubut Localidad simple (LS)
```
