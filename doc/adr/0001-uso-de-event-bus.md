# ADR 1: Uso del Patrón Event Bus para Navegación de Escenas

## Estado
Aceptado

## Contexto
En el Laboratorio 1, la navegación se realizaba mediante llamadas directas a `change_scene_to_file` con rutas absolutas, lo que provocaba un alto acoplamiento entre los paneles de interfaz de usuario.

## Decisión
Implementaremos el patrón Observer combinado con un Singleton Autoload (`EventBus`). Un script centralizado (`MainApp`) gestionará las instancias de escena basándose en las señales de navegación emitidas de manera indirecta por los componentes.

## Consecuencias
* **Positivas:** Bajo acoplamiento, facilidad para reorganizar o cambiar el árbol de directorios sin romper el código, mayor facilidad para testear escenas de manera aislada.
* **Negativas:** Introduce una pequeña capa de abstracción indirecta en el flujo de ejecución.
