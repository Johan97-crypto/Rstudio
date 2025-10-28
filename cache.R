# Implementación simplificada
crearCalculadoraMedia <- function() {
  cache <- list(
    valor = NULL,
    media = NULL
  )
  
  list(
    establecer = function(x) {
      cache$valor <<- x
      cache$media <<- NULL  # Limpiar caché cuando cambia el valor
    },
    
    obtener = function() {
      cache$valor
    },
    
    calcularMedia = function() {
      if (!is.null(cache$media)) {
        message("Usando caché...")
        return(cache$media)
      }
      message("Calculando media...")
      cache$media <<- mean(cache$valor, na.rm = TRUE)
      cache$media
    }
  )
}

# Uso de la versión simplificada
calc <- crearCalculadoraMedia()
calc$establecer(rnorm(1000000))

# Primera vez - calcula
media1 <- calc$calcularMedia()

# Segunda vez - usa caché
media2 <- calc$calcularMedia()

print(media1)
print(media2)