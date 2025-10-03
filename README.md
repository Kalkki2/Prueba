# PRESENTACIÓN: Sistema de Gestion de Informacion para Clinica Veterinaria

---

## 📖 Índice
1. [Capítulo I: Introducción](#capítulo-i-introducción)
2. [Estructura del Repositorio](#-estructura-del-repositorio)
3. [Contenido por Temas](#-contenido-por-temas)
   - [Tema 01: Permisos y Roles](#tema-01-permisos-y-roles)
   - [Tema 02: Procedimientos y Funciones Almacenadas](#tema-02-procedimientos-y-funciones-almacenadas)
   - [Tema 03: Optimización de Consultas con Índices](#tema-03-optimización-de-consultas-con-índices)
   - [Tema 04: Procedimientos y Funciones Avanzadas](#tema-04-procedimientos-y-funciones-avanzadas)
4. [Sistema de Gestión Veterinaria](#-sistema-de-gestión-veterinaria)
5. [Documento Principal](#-documento-principal)
6. [Autores](#-autores)

---

## 📌 Capítulo I: Introducción

### Caso de estudio
Una clínica veterinaria desea implementar una base de datos para gestionar la información de sus pacientes (mascotas), dueños, citas médicas y tratamientos.

- Cada mascota tiene un código único de identificación. Se desea almacenar el nombre, especie (perro, gato, ave, etc.), raza, fecha de nacimiento, peso y cualquier condición médica especial en caso de existir. Ej: Alérgico a droga (Nombre droga)
- Los dueños de las mascotas son registrados con un número de identificación único. Además, se almacenan datos personales como DNI, nombre, dirección, teléfono y correo electrónico.
- Las citas medicas son espontaneas y se registran al momento de la visita de la mascota a la veterinaria.
- Se registra el motivo de la cita, el veterinario asignado y cualquier observación posterior a la cita. Una cita está asociada a una única mascota y a un único veterinario.
- De cada veterinario se desea guardar su número de licencia profesional, nombre completo, especialidad (si la tiene, por ejemplo, ortopedia, oftalmología, etc.) y horario de atención.
- Si a una mascota se le prescribe un tratamiento, se desea registrar el nombre del tratamiento, duración, Medicamentos indicados y cualquier otra indicación relevante.
- El tratamiento, en caso de existir, debe estar asociado a una cita.
- En una misma cita, el veterinario puede indicar mas de un tratamiento.
- Un tratamiento debe permitir la aplicación de varios medicamentos
- De los medicamentos se necesita conocer: Nombre comercial, monodroga, presentación y laboratorio que lo comercializa.


