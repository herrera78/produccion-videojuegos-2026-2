# ADR 2: Adopción del Patrón Singleton (Autoload) para la Persistencia de Estado de la Aplicación

## Estado
Aceptado

## Contexto
El sistema interactivo está estructurado bajo una arquitectura dinámica donde las escenas secundarias (menús, simuladores de interfaz y paneles informativos) son cargadas y liberadas de la memoria física de manera cíclica por la clase central `MainApp`. Esta liberación total del SceneTree provoca la pérdida inmediata de cualquier selección de parámetros e ingredientes de la simulación cuando el usuario transiciona entre las diferentes etapas de la navegación. Es mandatorio contar con un mecanismo de persistencia que centralice el estado de los datos del usuario de forma independiente del ciclo de vida visual de la interfaz.

## Decisión
Implementaremos un Singleton Global denominado `GlobalManager` registrado a través de la infraestructura de carga de fondo del motor (Autoload). Esta clase actuará como un repositorio mutable centralizado y ordenado con tipado estricto. Las interfaces de usuario de personalización emitirán señales con los parámetros de datos y el `GlobalManager` los incorporará inmediatamente dentro de sus estructuras lógicas persistentes en memoria.

## Consecuencias
* **Positivas:** 
  * Salvaguarda de datos en memoria física durante toda la sesión del usuario a través de la conmutación dinámica de vistas.
  * Desacoplamiento total: las pantallas de recolección de ingredientes (`step_2_ingredients`) y de visualización del resumen de costos (`step_3_summary`) no poseen referencias físicas entre sí.
  * Estructura simplificada que reduce la deuda técnica del árbol jerárquico visual.
* **Negativas:** 
  * Introduce una clase con estado mutable global (Singleton), lo que incrementa el riesgo de acoplamiento lógico accidental si se abusa de llamadas masivas a este nodo global desde entidades secundarias. Se debe mitigar limitando las funciones del Singleton exclusivamente a la lectura y escritura del estado de la transacción.