# Tipos de Kernel
## 1. Monolítico
Es un kernel hecho para realizar todo tipo de tareas. A este tipo de kernel se le otorga la responsabilidad de gestionar la memoria y los procesos, comunicación entre procesos además de proporcionar funciones de soporte para drivers y hardware. Este tipo de kernel es el más común y el más usado en la actualidad.

## 2. Microkernel
Intencionalmente diseñado de un tamaño pequeño para que en caso de ocurrir un fallo no se afecte todo el sistema operativo. No obstante, este tipo de kernel es capaz de realizar las tareas de un kernel monolítico debido a que esta divido en varios modulos.

## 3. Híbrido
Es la combinación de un kernel monolítico y un microkernel. Esto se lleva a cabo conpactando el kernel monolítico y volviendolo más modulable. Otras partes del kernel se pueden cargar dinámicamente en el momento de ejecución.

# User vs Kernel Mode
## 1. User Mode
Es el modo en el que se ejecutan los programas de usuario. Cuando un proceso en user mode necesita algún recurso de hardware, la solicitud se envia al kernel. Como el acceso al hardware en este modo es limitado, tambien se le conoce como modo menos privilegiado, modo esclavo o modo restringido.

En este modo cada proceso tiene una propia dirección de memoria y no pueden accesar las direcciones de memoria pertenecientes al kernel. Así que, si un proceso falla esto no afectara al sistema operativo. Ese fallo solo afectara al proceso que fallo.

## 2. Kernel Mode
Cuando algún proceso se esta ejecutando en user mode y necesita accesar a un recurso de hardware, el proceso se encarga de realizar la solicitud al kernel. Estas solicitudes se llevan a cabo por medio de llamadas de sistema. Después la computadora entra en kernel mode para realizar la tarea solicitada. Cuando la termina de realizarla, regresa al user mode. A esta transición se le conoce como ***cambio de contexto***. Al kernel mode también se le conoce como modo privilegiado o modo de sistema. No es posible ejecutar todos los procesos en el kernel mode porque si algún proceso falla lo más probable es que el resto del sistema operativo tambien falle.

## 3. User vs Kernel Mode
Una computadora puede estar en user mode o kernel mode, pero no en ambos a la vez. La diferencia es que en user mode es donde las aplicaciones del usuario están siendo ejecutadas y al ser el modo no privligiado, no puede accesar a los recursos del hardware. Cuando algun proceso necesita accesar algún recurso del hardware, este cambia el modo a kernel mode para realizar la tarea solicitada. La computadora se encuntra cambiando de contexto entre user mode y kernel mode.