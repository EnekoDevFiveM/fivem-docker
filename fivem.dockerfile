# Imagen base
FROM debian:bullseye-slim

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils && \
    apt-get clean

# Descargar los artefactos de FiveM
WORKDIR /server
RUN curl -sSL https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/6118/fx.tar.xz | tar -xJ

# Copiar el archivo de configuración (puedes personalizar esto)
COPY server.cfg /server/server.cfg

# Puerto utilizado por FiveM
EXPOSE 30120

# Comando para iniciar el servidor
CMD ["bash", "run.sh"]
