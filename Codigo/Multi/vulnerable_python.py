# Ejemplo de código Python vulnerable a inyección de SQL
import sqlite3

def buscar_usuario(nombre):
    conn = sqlite3.connect('usuarios.db')
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM usuarios WHERE nombre='" + nombre + "'")
    resultados = cursor.fetchall()
    conn.close()
    return resultados

nombre_usuario = input("Ingrese el nombre del usuario a buscar: ")
usuarios_encontrados = buscar_usuario(nombre_usuario)
for usuario in usuarios_encontrados:
    print(usuario)
