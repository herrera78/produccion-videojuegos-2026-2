## [Sprint 1] - Laboratorio 2: Escenas, Nodos y Eventos
* **Fecha:** [Insertar Fecha de Desarrollo de 2026]
* **Funcionalidades:** Implementación exitosa de un sistema de navegación desacoplado entre 4 entornos modulares (Menú, Simulación Base, Configuración y Créditos) utilizando un cargador dinámico centralizado (`MainApp`) y escenas Control de UI altamente cohesivas.
* **Dificultades:** Comprensión de las ventajas del tipado estático (`-> void`) y la resolución del ámbito de carga de variables dinámicas al inicializar la escena principal cuando la referencia previa es nula.
* **Decisiones:** Se implementó el patrón Event Bus para eliminar llamadas directas cruzadas como `get_node()`, erradicando el antipatrón de dependencias rígidas. Se documentó la decisión mediante el estándar ADR-1.
