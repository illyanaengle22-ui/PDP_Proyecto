extends Node

const BANCO = [
	{
	"Patron": "Monolitica",
	"texto": "¿Cuál es una característica de la arquitectura monolítica?",
	"opciones":[
		"Servicios independientes",
		"Código centralizado en una sola unidad",
		"Comunicación por eventos"
	],
	"correcta": 1
	},
	{
	"Patron": "Monolitica",
	"texto": "¿Cuál es una desventaja de la arquitectura monolítica?",
	"opciones":[
		"Alta escalabilidad",
		"Complejidad en red",
		"Difícil escalabilidad"
	],
	"correcta": 2
	},
	{
	"Patron": "Cliente-Servidor",
	"texto": "En la arquitectura cliente-servidor, ¿quién procesa la información?",
	"opciones":[
		"El cliente",
		"El servidor",
		"Ambos al mismo tiempo"
	],
	"correcta": 1
	},
	{
	"Patron": "Cliente-Servidor",
	"texto": "¿Cuál es una ventaja del modelo cliente-servidor?",
	"opciones":[
		"Descentralización total",
		"Control y seguridad centralizada",
		"No requiere red"
	],
	"correcta": 1
	},
	{
	"Patron": "P2P",
	"texto": "¿Qué caracteriza a la arquitectura P2P?",
	"opciones":[
		"Un servidor principal",
		"Todos los nodos tienen el mismo rol",
		"Uso exclusivo de bases de datos"
	],
	"correcta": 1
	},
	{
	"Patron": "P2P",
	"texto": "¿Cuál es una desventaja del modelo P2P?",
	"opciones":[
		"Fácil control del sistema",
		"Alta dependencia del servidor",
		"Dificultad para controlar el contenido"
	],
	"correcta": 2
	},
	{
	"Patron": "En Capas",
	"texto": "¿Qué divide la arquitectura en capas?",
	"opciones":[
		"Usuarios",
		"Funciones del sistema en niveles",
		"Equipos de trabajo"
	],
	"correcta": 1
	},
	{
	"Patron": "En Capas",
	"texto": "¿Cuál es una ventaja de la arquitectura en capas?",
	"opciones":[
		"Mayor desorden",
		"Modularidad",
		"Menor mantenimiento"
	],
	"correcta": 1
	},
	{
	"Patron": "En Capas",
	"texto": "¿Qué problema puede presentar la arquitectura en capas?",
	"opciones":[
		"Falta de seguridad",
		"Bajo rendimiento",
		"Falta de estructura"
	],
	"correcta": 1
	},
	{
	"Patron": "Microkernel",
	"texto": "¿Qué es el microkernel?",
	"opciones":[
		"Un sistema con múltiples servidores",
		"Un núcleo mínimo con extensiones",
		"Un sistema basado en eventos"
	],
	"correcta": 1
	},
	{
	"Patron": "Microkernel",
	"texto": "¿Cuál es una ventaja del microkernel?",
	"opciones":[
		"Difícil de modificar",
		"Extensibilidad mediante plugins",
		"Alto acoplamiento"
	],
	"correcta": 1
	},
	{
	"Patron": "SOA",
	"texto": "¿Qué significa SOA?",
	"opciones":[
		"Sistema Operativo Avanzado",
		"Software Orientado a Aplicaciones",
		"Arquitectura Orientada a Servicios"
	],
	"correcta": 2
	},
	{
	"Patron": "SOA",
	"texto": "¿Cuál es una característica de SOA?",
	"opciones":[
		"Servicios independientes comunicados por APIs",
		"Código en una sola unidad",
		"Sin uso de red"
	],
	"correcta": 0
	},
	{
	"Patron": "SOA",
	"texto": "¿Cuál es una ventaja de SOA?",
	"opciones":[
		"Reutilización de servicios",
		"Baja complejidad",
		"No usa APIs"
	],
	"correcta": 0
	},
	{
	"Patron": "Microservicios",
	"texto": "¿Qué caracteriza a los microservicios?",
	"opciones":[
		"Sistema único",
		"Servicios pequeños e independientes",
		"Uso obligatorio de un solo lenguaje"
	],
	"correcta": 1
	},
	{
	"Patron": "Microservicios",
	"texto": "¿Cuál es una ventaja de los microservicios?",
	"opciones":[
		"Escalabilidad individual",
		"Fácil control total",
		"Bajo uso de red"
	],
	"correcta": 0
	},
	{
	"Patron": "Microservicios",
	"texto": "¿Cuál es una desventaja de microservicios?",
	"opciones":[
		"Baja flexibilidad",
		"Alta complejidad operativa",
		"Falta de escalabilidad"
	],
	"correcta": 1
	},
	{
	"Patron": "EDA",
	"texto": "¿Qué significa EDA?",
	"opciones":[
		"Estructura de Datos Avanzada",
		"Arquitectura Dirigida por Eventos",
		"Sistema de Datos Empresariales"
	],
	"correcta": 1
	},
	{
	"Patron": "EDA",
	"texto": "¿Qué caracteriza a EDA?",
	"opciones":[
		"Procesamiento sin eventos",
		"Comunicación asincrónica",
		"Uso de un solo servidor"
	],
	"correcta": 1
	},
	{
	"Patron": "EDA",
	"texto": "¿Cuál es un ejemplo de uso de EDA?",
	"opciones":[
		"Aplicación monolítica",
		"Procesador de texto",
		"Sistema de detección de fraude en tiempo real"
	],
	"correcta": 2
	}
]
