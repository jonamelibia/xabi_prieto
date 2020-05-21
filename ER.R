##########################################################################################
### COINCIDENCIAS BÁSICAS

### Seleccionar una subcadena
ejemplo <- "Hello world"
substring(ejemplo, 7,11)
substr(ejemplo, 7,11)
substring(ejemplo, 7,11) <- "Marta"
ejemplo

tuberculo <- "Patata"
substring(tuberculo, 6, 9) <- "ita"
tuberculo

### Determinar la largura de un string
nchar(ejemplo)
length(ejemplo)

### Concatenar cadenas
paste("La","patata","no","se","puede","poseer")
paste("La","patata","es","un","fruto","de","la","madre","naturaleza", sep = " ")

cancion <- c("La ciencia estudiará tu mutación","Le pondrán tu nombre a una infección",
             "¡Qué bajón!")
paste(cancion, collapse = "/ ")

### Imprimir texto con números
x <- 2
sprintf("%d mas %d son %d", x, x, x+x)

x <- 2
y <- 3
sprintf("%d mas %d son %d", x, y, x+y)

### Separar elementos de un string
capitulo <- "Homer/latifundista/azucarero"
strsplit(capitulo, "/")
paste(rev(unlist(strsplit(capitulo, NULL))), collapse="")

### Identificar si una subcadena pertenece a una cadena
frase <- "Mayorista no limpio pescado" 
buscar <- "cado"
grepl(buscar, frase)

frases <- c("Seguro dental", "Lisa necesita un aparato")
buscar <- c("dent","Lisa")
grepl(paste(buscar, collapse = "|"), frases)
stringr::str_detect(pattern = buscar, frases)
grep(paste(buscar, collapse = "|"), frases, value = T)
stringr::str_length(frases)

lista <- "a ante bajo cabe con contra de desde en entre hacia hasta para por según sin so sobre tras durante mediante excepto salvo incluso"
patron <- " "
preposiciones <- stringr::str_split(lista, patron)[[1]]
grep("s", preposiciones)

### Encontrar patrones en una cadena
frase <- c("Me","minas","la", "moral")
if(grep("moral", frase))
  cat("moral aparece en\n\t", frase, "\n")

regexpr("moral", frase)
gregexpr("moral", frase)
match("moral", frase)
pmatch("mo", frase) # coincidencias parciales
"moral" %in% frase

trabalenguas <- c("el cielo está enladrillado","quién lo desenladrillará")
patron <- "(cielo|enladri)"
regmatches(trabalenguas, gregexpr(patron, trabalenguas))
stringr::str_extract(trabalenguas, patron)
stringr::str_extract_all(trabalenguas, patron, simplify = T)

cumple1 <- "5 dec 1988"
cumple2 <- "14 mar 1989"
regexp <- "([[:digit:]]{2}) ([[:alpha:]]+) ([[:digit:]]{4})"
grepl(pattern = regexp, x = cumple1)
stringr::str_detect(cumple1, regexp)
grepl(pattern = regexp, x = cumple2)

### Reemplazo de coincidencias
saludo <- "Bienvenid@s tod@s"
chartr("@", "e", saludo)

x <- c("R apesta","R es aburrido", "R es para losers")
gsub("R","Python",x)
gsub("R","Python",x,ignore.case = T)
stringr::str_replace(x,"R","python")

Telefono_Homer <- "555-65.28"
gsub(pattern="[[:punct:]]", Telefono_Homer, replacement=" ")
stringr::str_replace_all(Telefono_Homer, "[[:punct:]]", " ")

### Fraccionar una cadena a partir de una subcadena
frase <- c("La marta es un precioso mustélido",
           "el nombre científico de la marta es Martes martes",
           "la moneda croata se llama Kuna en homenaje a la marta")
strsplit(frase, "marta")
stringr::str_split(frase, "marta")
stringr::str_locate(frase, "marta")
stringr::str_locate_all(frase, "marta")

### Extraer coincidencias
archivos <- c("retos-a-mi.ods", "matamecamion.csv", "ultra_gore_brutal_experience.xls", 
              "reto4_v2.1.3.4.5.csv", "finalisimo.ods", "finalisimo2.csv", "ESTESI.csv",
              "Script_finalv20.R", "cajon_de_sastre.csv")
stringr::str_subset(archivos, "\\.csv|\\.ods") # que termine en .csv o en .ods
stringr::str_subset(archivos, "^fina") # que empiecen por fina
stringr::str_extract(archivos, "[a-zA-Z]*$") # que tengan caracteres alfabéticos antes del punto
stringr::str_subset(archivos, "(\\_|\\-)[a-zA-Z]*\\.(csv|ods)$") # que puedan tener guiones o barras bajas

### Contar número de coincidencias y/o localizarlas
string <- "Yo tengo un clip clip clip, yo tengo un clap clap clap"
tau::textcnt(string,n=1L,method="string")
tau::textcnt(string,method="string")

Hmisc::substring.location("mariscos recio el mar al mejor precio","mar")
Hmisc::first.word("mariscos recio el mar al mejor precio")
Hmisc::capitalize("rita, the chicken seller")

### Unir varias cadenas en una
stringr::str_c(c("Quiero", "patatas", "fritas"), collapse = ", ")

### Convertir a mayúsculas-minúsculas
stringr::str_to_upper(c("Hola","Mundo"))
stringr::str_to_lower(c("Hola","Mundo"))

### Ordenar alfabéticamente y/o detectar coincidencias
onomatopeya <- c("Miau","Guau","Cuack")
stringr::str_sort(onomatopeya)
stringr::str_view(onomatopeya, ".a.")
stringr::str_view(onomatopeya, "^a")
stringr::str_view(onomatopeya, "u$")
stringr::str_view(c("Cuándo", "Cuando","Qando"), "Cu(a|á)ndo")

Coronavirus_RT <- "attaaaggtttataccttcccaggtaacaaaccaaccaactttcgatctcttgtagatct"
nchar(Coronavirus_RT)
stringr::str_view_all(Coronavirus_RT, "aaa?")
stringr::str_view_all(Coronavirus_RT, "aaa+")
stringr::str_view_all(Coronavirus_RT, "a[gg]+")
stringr::str_view_all(Coronavirus_RT, "t{2,3}")

parecidos_razonables <- c("manzana", "manzanilla", "monzón")
stringr::str_detect(parecidos_razonables, "anz")
plyr::count(stringr::str_detect(parecidos_razonables, "^m"))
stringr::str_count(parecidos_razonables, "^m")
stringr::str_detect("\n anz \n", regex(".anz.", dotall = TRUE))

###########################################################################################
#### FECHAS

library(tidyverse)
library(lubridate)

today()
now()

ymd("2020-05-11")
ymd(20200511, tz = "UTC")

ahora_mismo <- today()
year(ahora_mismo)
month(ahora_mismo)
month(ahora_mismo, label = T)
day(ahora_mismo)
yday(ahora_mismo) # día del año
wday(ahora_mismo) # día de la semana

(edad <- today() - ymd(19881205))
as.duration(edad)
dseconds(10)
dminutes(10)
dhours(10)
ddays(10)
dweeks(10)
dyears(10)

#########################################################################################
# https://en.wikibooks.org/wiki/R_Programming/Text_Processing