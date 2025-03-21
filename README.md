# Como Mostrar Datos desde Firebase Realtime Database en una Página Web

## ¿Cómo logramos integrar Firebase en un proyecto web?

## Pasos a realizar

### 1. **Abre un Codespace en tu repositorio de GitHub:**
   Lo primero que hay que hacer es abrir un **Codespace** desde tu repositorio de GitHub. Codespaces te permitirá tener un entorno de desarrollo en la nube sin tener que configurar nada localmente. 

### 2. **Instalar Nginx en el Codespace:**
   Luego, hay que instalar dentro del Codespace **Nginx**, que es un servidor web ligero y muy rápido. Nginx te servirá para redirigir las peticiones y servir tu página HTML. Esto es muy útil porque con Nginx, puedes servir contenidos web sin complicaciones.

    >> sudo apt update && upgrade
    >> sudo apt install nginx

### 3. **Definir un `index.html` personalizado:**
   Después de instalar Nginx, tienes que definir tu archivo **index.html** personalizado. Este archivo HTML contiene todo el código necesario para mostrar los datos de Firebase, y además está preparado para conectar con la base de datos en tiempo real de Firebase a través de JavaScript.

#### 3.1 **¿Como personalizo el `index.html`?**
Para poder personalizar tu **index.html** deberas dirigirte a la ruta de instalacion del servidor Nginx en cuestion. La ruta predeterminada es **/var/www/html**. Dentro de esa ruta encontraras un unico archivo que sera el que editaremos con el comando **sudo nano index.html**.
De momento solo le pondremos algo identificativo para diferenciar nuestra web de la predeterminada de Nginx.

Por ejemplo:

    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Página de NGINX</title>
    </head>
    <body>
        <h1>Página de NGINX dentro de Codespace de 'alumno X'>"</h1>
    </body>
    </html>


### 4. **Redirigir el puerto 80 y acceder al HTML modificado:**
Para poder hacer visible la web que hemos creado tendremos que redirigir el puerto 80 de nuestro Codespace.

Para redirigir el puerto 80 tendremos que ir abajo del codedspace donde se indica en al imagen e ir al apartado de "Puertos"
   
![alt text](.images/redireccion_puerto.png)

En "Puertos" simplemente le damos a "Agregar puerto", escrivimos 80 y le damos al ENTER.

Como se ha visto en la imagen anterior se nos genera una URL, la cual es donde  podremos visualizar nuestra web.
Si aparece un error de conexion o por el estilo lo más probable es que nuestro servicio de Nginx se haya terminado/parado. La solucion es simple, tenemos que volver a levantar/iniciar ese servicio de la siguiente forma:

    >> sudo service restart
    O
    >> sudo service start

Para que esa web la pueda ver cualquier persona desde Internet deberás cambiar la visibilidad del puerto de Privada a Publica haciendo clic derecho encima de el puerto 80, y tal como se muestra en al imagen selecciona Visibilidad del puerto y ponla en Public

![alt text](.images/visibilidad_puerto.png)

### 5. **Crear la Realtime Database en Firebase e importar la BBDD en JSON:**
A continuación tendras que acceder a tu **Realtime Database** en Firebase. Desde allí, subir el archivo **JSON** BBDD_Completa.json que contiene las tablas de datos que queremos mostrar en la web. Esto es muy sencillo, ya que Firebase me permite subir el archivo directamente y automáticamente organiza los datos como nodos dentro de la base de datos NoSQL.

#### 5.1 **Paso a paso**
Accede a la web de [Firebase](https://firebase.google.com/docs/database?hl=es) e inicia sesion con tu cuenta de Google en el apartado de "Accede". <br>
Una vez iniciada la sesion iremos a "Go to console"

![alt text](.images/go_to_console_firebase.png)

Una vez en la consola de Firebase le daremos a "Crear un proyecto", introduciremos un nombre para este. Cuando nos pregunte por Google Analitics le daremos a que No ya que en este caso de uso no nos hara ningun tipo de falta y crearemos el proyecto.

Cuando nuestro proyecto se haya creado correctamente nos aparecera la pantalla siguiente:

![alt text](.images/pantalla_inicial_firebase.png)

Iremos al menu de la izqiera y desplegaremos el apartado de "Compilación" y "Realtime Database".

![alt text](.images/menu_lateral_realtimeDB.png)

Dentro de la Realtime Database nos aparecera un boton en medio de la pantalla reclamando que creemos una nueva BBDD.

![alt text](.images/crear_realtimeDB.png)

Deberemos configurar de forma adecuada segun nuestras preferencias.
En este caso en el apartado de Ubicación de la Realtime DB seleccionare la zora horaria "Bélgica (europe-west1)", y para las "Reglas de seguridad" lo dejaremos en el modo de prueba.

Cuando hayamos creado la Realtime DB ya estaremos preparados para poder importar el JSON de la BBDD (en este caso utilizare el JSON de este proyecto: [BBDD_Completa.json](BBDD_Completa.json)).

Para importae el fichero JSON iremos a los tres puntos situados dentro de la Realtime DB a la derecha. Nos saldran varias opciones pero seleccionaremos "Import JSON" y lo subiremos.

![alt text](.images/importar_json.png)

Si la importacion se ha realizado correctamente nos saldrá un popup arriba a la derecha como este:

![alt text](.images/popup_correcto.png)

Si da algun error probablemete sea porque el JSON tiene alguna inconsistenacia o el archivo no se formateo de forma correcta.

Ahora que ya hemos importado el JSON correctamente nos queda un paso más dentro de Firebase antes de empezar a mostrar los datos desde nuestra web.

Tendremos que volver a la Descripción General. En la pantalla principal nos aparecerá lo siguiente:

![alt text](.images/registrar_app_web.png)

La opción que en este caso nos interersa es la del icono web "</>".
Registramos la app con un nombre identificativo y le daremos a siguiente hasta volver a la Descripción General.

Iremos a "Configuracion del proyecto" y bajaremos hasta el apartado de "Tus Apps".

![alt text](.images/config_proyecto.png)

No mostrare mi configuracion ya que cualquiera podria conectarse a la base de datos,pero necesitaremos saber estos paramentros para poder vincular nuestra Realtime DB a la web.

![alt text](.images/SDK_Firebase.png)

Ahora con estos datos podemos volver al Codespace para empezar a implementar Firebase en nuestra web.

### 6. **Instalar Firebase en el Codespace:**
Una vez de nuevo en nustro Codespace instalaremos el **CLI y SDK de Firebase** en el proyecto para poder interactuar con la Realtime Database. Esto nos permitirá obtener los datos desde Firebase y mostrarlos dinámicamente en la página.

#### 6.1 **Instalar Firebase CLI y SDK**
Ejecuta el siguiente comando en la terminal para instalar Firebase CLI:

```sh
npm install -g firebase-tools firebase
```

#### 6.2 **Autenticarse en Firebase**
Para iniciar sesión en Firebase, usa el siguiente comando:
```sh
firebase login --no-localhost
```
Sigue los pasos indicados en pantalla para completar la autenticación.

#### 6.3 **Crea una Carpeta para el Proyecto**
Crea y accede a una carpeta donde se almacenará el proyecto de Firebase:
```sh
mkdir proyecto_firebase
cd proyecto_firebase
```

#### 6.4 **Inicializar Firebase**
Dentro de la carpeta del proyecto, ejecuta:
```sh
firebase init
```

Durante la instalación:
- Usa las flechas para desplazarte hasta Realtime Database.
- Selecciónala presionando espacio.
- Presiona Enter para continuar.

Cuando se te pregunte por el proyecto, selecciona Use existing project y elige tu proyecto de Firebase.
Si se solicita un archivo de seguridad, simplemente presiona Enter para seleccionar la opción predeterminada de Firebase.

Una vez finalizado este proceso, habremos instalado y configurado Firebase correctamente en nuestro Codespace.


### 7. **Modificar el `index.html` para obtener los datos de la Realtime Database:**
   El último paso fue modificar mi archivo `index.html` con los parámetros necesarios para **conectar con Firebase** y obtener los datos. Usé el SDK de Firebase para hacer consultas a la base de datos y mostrar esos datos en diferentes **desplegables (selects)** en la página.

## ¿Qué logré con todo esto?

### La Conexión con Firebase
   Firebase me permitió conectar mi página web con la base de datos en tiempo real. Usé el **Realtime Database de Firebase** para almacenar las 5 tablas que tenía en formato JSON, y luego las consulté directamente desde el HTML usando JavaScript. ¡Así de fácil!

### Mostrar los Datos en la Página Web
   Lo más interesante fue cómo mostré esos datos. Para hacerlo más interactivo, creé **5 desplegables (select)**, uno para cada tabla de datos. Al cargar la página, estos desplegables se llenaron con los datos de las tablas de Firebase, permitiendo a los usuarios interactuar con la información de forma cómoda.

### Todo Funcionando Junto
   Lo mejor de todo es que, al final, todo funcionó en conjunto. Nginx está sirviendo la página web, Firebase me da los datos, y mi código JavaScript se encarga de mostrar todo correctamente en la interfaz de usuario.

## Código HTML + JS para Mostrar los Datos de Firebase en Desplegables

Aquí te dejo el código que utilicé para que puedas adaptarlo a tu propio proyecto:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Web con Firebase y CodeSpace</title>
    <!-- Cargar Firebase SDK como módulos -->
    <script type="module">
        import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js";
        import { getDatabase, ref, get } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-database.js";

        // Configuración de Firebase
        const firebaseConfig = {
            apiKey: "AIzaSyCNbuKBSOrv1Fz7WA4JtLKIO3q7EwPAFJo",
            authDomain: "ifcd0112-pnm.firebaseapp.com",
            databaseURL: "https://ifcd0112-pnm-default-rtdb.europe-west1.firebasedatabase.app",
            projectId: "ifcd0112-pnm",
            storageBucket: "ifcd0112-pnm.firebasestorage.app",
            messagingSenderId: "776063739293",
            appId: "1:776063739293:web:a821f0310bcbcd8bf0fb74"
        };

        // Inicializar Firebase
        const app = initializeApp(firebaseConfig);
        const database = getDatabase(app);

        // Función para obtener datos desde Realtime Database
        const getData = async (tableName, selectElement) => {
            try {
                const snapshot = await get(ref(database, tableName)); // Obtener datos del nodo
                if (!snapshot.exists()) {
                    console.log(`No se encontraron datos en ${tableName}`);
                    return;
                }

                const data = snapshot.val();

                // Limpiar el select antes de agregar nuevas opciones
                selectElement.innerHTML = "";

                // Agregar un "option" vacío para la selección
                const option = document.createElement("option");
                option.textContent = `Selecciona un campo de ${tableName}`;
                selectElement.appendChild(option);

                // Iterar sobre los datos de la tabla y agregar las opciones al desplegable
                for (const key in data) {
                    if (data.hasOwnProperty(key)) {
                        const option = document.createElement("option");
                        option.textContent = `ID: ${key} - ${JSON.stringify(data[key])}`;
                        selectElement.appendChild(option);
                    }
                }
            } catch (error) {
                console.error("Error al obtener los datos de Realtime Database:", error);
            }
        };

        // Función que se ejecuta al cargar la página para mostrar los datos
        window.onload = () => {
            const categoriaSelect = document.getElementById("categoria");
            const continenteSelect = document.getElementById("continente");
            const paisSelect = document.getElementById("pais");
            const productoSelect = document.getElementById("producto");
            const factsSelect = document.getElementById("facts");

            // Obtener datos para cada tabla
            getData("Categoria", categoriaSelect);
            getData("Continentes", continenteSelect);
            getData("Paises", paisSelect);
            getData("Productos", productoSelect);
            getData("Facts", factsSelect);
        };
    </script>
</head>
<body>

<h1>Conexión con Firebase - Realtime Database</h1>

<h2>Selecciona una tabla:</h2>

<!-- Desplegables para cada tabla -->
<label for="categoria">Categorias:</label>
<select id="categoria"></select>
<br><br>

<label for="continente">Continentes:</label>
<select id="continente"></select>
<br><br>

<label for="pais">Paises:</label>
<select id="pais"></select>
<br><br>

<label for="producto">Productos:</label>
<select id="producto"></select>
<br><br>

<label for="facts">Facts:</label>
<select id="facts"></select>

</body>
</html>
