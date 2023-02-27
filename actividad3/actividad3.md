# Solución al Bug en el Contenedor del Frontend

El problema es que las aplicaciones de React solamente utilizan un único archivo html por lo que cuando se accede directamente a alguna ruta nginx no encuentra los archivos archivos html para cargarlos.

Entonces se debe sobre escribir el archivo de configuración por defecto de nginx y este debe incluir las siguientes configuraciones:
~~~
server {
  listen 80;
  location / {
    root   /usr/share/nginx/html;
    index  index.html index.htm;
    try_files $uri $uri/ /index.html;
  }
}
~~~
La parte importante de la configuración es el pedazo de try_files que es la que no puede encontrar los archivos para las rutas que se están intentando acceder.

Para que los cambios se vean realizados en el contenedor se debe agregar la siguiente línea al Dockerfile:
~~~
COPY nginx.conf /etc/nginx/nginx.conf
~~~
Esta línea se agrega después de la línea:
~~~
COPY --from=compilacion /app/build /usr/share/nginx/html
~~~
