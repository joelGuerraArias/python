from tkinter import *
import tkinter as tk
from tkinter import messagebox as mb
import sqlite3

# Configuración de la ventana Principal

ventana = tk.Tk()
ventana.title("Tienda Electrónica")
ventana.geometry("940x400+50+50")
ventana.config(bg="white")
ventana.iconbitmap("icono.ico")

db = sqlite3.connect('electronicaDR.db')
c = db.cursor()

# Ventana Registro


def nuevaVentana():

    # Configuración ventana Registro

    newVentana = tk.Toplevel(ventana)
    newVentana.title("Registro de Usuario")
    newVentana.geometry("300x300+860+50")
    newVentana.config(bg="white")

    # Etiquetas

    labelExample = tk.Label(newVentana, text="Registro", bg="white", font=(
        "Comic Sans MS", 16)).pack(side="top")  # Texto 'Registro'

    Label(newVentana, text="Nombre : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja3 = Entry(newVentana)
    caja3.pack()

    Label(newVentana, text="Valor : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja4 = Entry(newVentana)
    caja4.pack()

    Label(newVentana, text="Microcontrolador : ",
          bg="white", font=("Comic Sans MS", 10)).pack()
    caja5 = Entry(newVentana)
    caja5.pack()

    Label(newVentana, text="Lenguaje : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja6 = Entry(newVentana)
    caja6.pack()

    Label(newVentana, text="Creador : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja7 = Entry(newVentana)
    caja7.pack()

    # Función Registro

    def registro():

        # Se toman variables por cada caja

        Nombre = caja3.get()
        Valor = caja4.get()
        Microcontrolador = caja5.get()
        Lenguaje = caja6.get()
        Creador = caja7.get()

        # El cursor actúa en la creación de cada registro

        c.execute("INSERT INTO usuarios values(\'" + Nombre + "\',\'" + Valor +
                  "\',\'" + Microcontrolador + "\',\'" + Lenguaje + "',\'" + Creador + "')")
        db.commit()
        mb.showinfo(title="Registro Correcto",
                    message="Su registro fue exitoso.")

    # Se crea un botón para habilitar la función "registro"

    buttons = tk.Button(newVentana, text="Registrar", command=registro,
                        bg="white", font=("Comic Sans MS", 10)).pack(side="bottom")

# Ventana Actualizar


def nuevaVentana2():

    # Configuración ventana Actualizar

    newVentana2 = tk.Toplevel(ventana)
    newVentana2.title("Actualización de Usuario")
    newVentana2.geometry("300x300+860+50")
    newVentana2.config(bg="white")

    # Etiquetas

    labelExample = tk.Label(newVentana2, text="Actualizar", bg="white", font=(
        "Comic Sans MS", 16)).pack(side="top")

    Label(newVentana2, text="Nombre : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja3 = Entry(newVentana2)
    caja3.pack()

    Label(newVentana2, text="Valor : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja4 = Entry(newVentana2)
    caja4.pack()

    Label(newVentana2, text="Microcontrolador : ",
          bg="white", font=("Comic Sans MS", 10)).pack()
    caja5 = Entry(newVentana2)
    caja5.pack()

    Label(newVentana2, text="Lenguaje : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja6 = Entry(newVentana2)
    caja6.pack()

    Label(newVentana2, text="Creador : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja7 = Entry(newVentana2)
    caja7.pack()

    # Función actualizar (act)

    def act():

        # Por cada entrada se crea una variable

        Nombre = caja3.get()
        Valor = caja4.get()
        Microcontrolador = caja5.get()
        Lenguaje = caja6.get()
        Creador = caja7.get()

        # Por cada posible cambio a se ejecutará según el valor b, c, d, e

        c.execute(
            "UPDATE usuarios set Nombre=:Nombre where Valor=:Valor and Microcontrolador=:Microcontrolador and Lenguaje=:Lenguaje and Creador=:Creador",
            {"Nombre": Nombre, "Valor": Valor, "Microcontrolador": Microcontrolador, "Lenguaje": Lenguaje,
             "Creador": Creador})
        c.execute(
            "UPDATE usuarios set Microcontrolador=:Microcontrolador where Nombre=:Nombre and Valor=:Valor and Lenguaje=:Lenguaje and Creador=:Creador",
            {"Nombre": Nombre, "Valor": Valor, "Microcontrolador": Microcontrolador, "Lenguaje": Lenguaje,
             "Creador": Creador})
        c.execute(
            "UPDATE usuarios set Valor=:Valor where Nombre=:Nombre and Microcontrolador=:Microcontrolador and Lenguaje=:Lenguaje and Creador=:Creador",
            {"Nombre": Nombre, "Valor": Valor, "Microcontrolador": Microcontrolador, "Lenguaje": Lenguaje,
             "Creador": Creador})
        c.execute(
            "UPDATE usuarios set Lenguaje=:Lenguaje where Nombre=:Nombre and Microcontrolador=:Microcontrolador and Valor=:Valor and Creador=:Creador",
            {"Nombre": Nombre, "Valor": Valor, "Microcontrolador": Microcontrolador, "Lenguaje": Lenguaje,
             "Creador": Creador})
        c.execute(
            "UPDATE usuarios set Creador=:Creador where Nombre=:Nombre and Microcontrolador=:Microcontrolador and Valor=:Valor and Lenguaje=:Lenguaje",
            {"Nombre": Nombre, "Valor": Valor, "Microcontrolador": Microcontrolador, "Lenguaje": Lenguaje,
             "Creador": Creador})
        db.commit()
        mb.showinfo(title="Actualización Correcta",
                    message="Su actualización fue realizada.")

    # Se crea un botón para habilitar la función "act"
    buttons = tk.Button(newVentana2, text="Registrar", command=act,
                        bg="white", font=("Comic Sans MS", 10)).pack(side="bottom")

# Ventana Eliminar


def nuevaVentana3():

    # Configuración ventana Eliminar

    newVentana3 = tk.Toplevel(ventana)
    newVentana3.title("Eliminación de Usuario")
    newVentana3.geometry("300x300+860+50")
    newVentana3.config(bg="white")

    # Etiquetas

    labelExample = tk.Label(newVentana3, text="Eliminar : ", bg="white", font=("Comic Sans MS", 16)).pack(
        side="top")

    Label(newVentana3, text="Nombre : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja3 = Entry(newVentana3)
    caja3.pack()

    Label(newVentana3, text="Valor : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja4 = Entry(newVentana3)
    caja4.pack()

    Label(newVentana3, text="Microcontrolador : ",
          bg="white", font=("Comic Sans MS", 10)).pack()
    caja5 = Entry(newVentana3)
    caja5.pack()

    Label(newVentana3, text="Lenguaje : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja6 = Entry(newVentana3)
    caja6.pack()

    Label(newVentana3, text="Creador : ", bg="white",
          font=("Comic Sans MS", 10)).pack()
    caja7 = Entry(newVentana3)
    caja7.pack()

    # Función Eliminar

    def delete():

        # Por cada entrada se crea una variable

        Nombre = caja3.get()
        Valor = caja4.get()
        Microcontrolador = caja5.get()
        Lenguaje = caja6.get()
        Creador = caja7.get()

        c.execute("DELETE FROM usuarios WHERE Nombre=:Nombre and Valor=:Valor and Microcontrolador=:Microcontrolador and Lenguaje=:Lenguaje and Creador=:Creador",
                  {"Nombre": Nombre, "Valor": Valor, "Microcontrolador": Microcontrolador, "Lenguaje": Lenguaje, "Creador": Creador})
        db.commit()
        mb.showinfo(title="Eliminación Correcta",
                    message="La Eliminación fue realizada.")

    # Se crea un botón para habilitar la función "delete"

    buttons = tk.Button(newVentana3, text="Borrar", command=delete,
                        bg="white", font=("Comic Sans MS", 10)).pack(side="bottom")

# Imágenes


imagen = PhotoImage(file=r"1.png")
etiqueta = Label(ventana, image=imagen)
etiqueta.place(x=10, y=10)
etiqueta.config(bg="white")

imagen1 = PhotoImage(file=r"2.png")
etiqueta = Label(ventana, image=imagen1)
etiqueta.place(x=320, y=10)
etiqueta.config(bg="white")

imagen2 = PhotoImage(file=r"3.png")
etiqueta = Label(ventana, image=imagen2)
etiqueta.place(x=630, y=10)
etiqueta.config(bg="white")

# Botones

boton1 = Button(ventana, text="REGISTRO", bg='DodgerBlue2',
                command=nuevaVentana, font=("Comic Sans MS", 22), fg="white")
boton1.place(x=60, y=330, width=200, height=30)

boton2 = Button(ventana, text="ACTUALIZAR", bg='lime green',
                command=nuevaVentana2, font=("Comic Sans MS", 22), fg="white")
boton2.place(x=370, y=330, width=200, height=30)

boton3 = Button(ventana, text="ELIMINAR", bg='red',
                command=nuevaVentana3, font=("Comic Sans MS", 22), fg="white")
boton3.place(x=690, y=330, width=200, height=30)

ventana.mainloop()
