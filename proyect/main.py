import getpass as gp
import time
import SQLconnector
import os

cursor = SQLconnector.db.cursor()
# cursor.execute()

# Clase create_dict usada para mostrar los datos obtenidos de la base de datos

class create_dict(dict):
    def __init__(self):
        super().__init__()
        dict()

    def add(self, key, value):
        self[key] = value

mydict = create_dict()


# Función para el inicio de sesión.

def logIn():
    while True:
        try:

            # Contador de intentos para definir el bloqueo de la cuenta después de 3 intentos fallidos.

            intentos = 0
            
            while True:

                os.system("cls")

                print(" --- Inicio de sesión Correo de Yury --- \n")

                # Inicio de sesión

                userName = input("Nombre de usuario: ")
                passwd = gp.getpass("Contraseña: ")

                if intentos < 2:

                    os.system("cls")

                    # Creación de la consulta sql para buscar el nombre de usuario ingresado
                    # previamente dentro de la base de datos, y almacenandolo en una variable.

                    sql = "select NOMBRE_USUARIO from EMPLEADO where NOMBRE_USUARIO = (%s)"

                    cursor.execute(sql, [userName,])
                    sUN = cursor.fetchone()

                    # Checkeo de que el nombre de usuario se haya encontrado  .
                                  
                    if sUN[0] == "":
                        os.system("cls")
                        print("Nombre de usuario no encontrado, reintente")
                        time.sleep(1)
                        continue
                    else:

                        # Si el usuario fue encontrado, se extrae la contraseña almacenada
                        # en ese usuario para usarla en el inicio de sesión.

                        sql = "select CONTRASENIA from EMPLEADO where NOMBRE_USUARIO = (%s)"

                        cursor.execute(sql, [userName,])
                        sPW = cursor.fetchone()
                        
                        # Se checkea que se haya encontrado algo en la búsqueda.

                        if sPW[0] != "":
                            if sPW[0] == passwd:

                                # Si la contraseña encontrada coincide con la ingresada, entonces el usuario
                                # puede iniciar sesión.
                                
                                os.system("cls")
                                print("Verificando estado...")

                                # Verificando si el estado del empleado es activo, de lo contrario
                                # no puede ingresar al programa.

                                sql = "select ID_ESTADO from EMPLEADO where NOMBRE_USUARIO = (%s)"                                
                                cursor.execute(sql, [userName,])
                                est = cursor.fetchone()
                                time.sleep(1.5)

                                if est[0] == 1:
                                    os.system("cls")
                                    print("¡Usuario activo!")
                                    time.sleep(1)

                                    x = 0

                                    while x < 5:
                                        os.system("cls")
                                        print("Iniciando sesión.")
                                        time.sleep(0.1)
                                        os.system("cls")
                                        print("Iniciando sesión..")
                                        time.sleep(0.1)
                                        os.system("cls")
                                        print("Iniciando sesión...")
                                        time.sleep(0.1)
                                        x += 1
                                    
                                    os.system("cls")
                                    print("Sesión iniciada con éxito!")

                                    # Se retorna el userName para que después en el menú principal sea utilizado
                                    # para identificar quién es el que está en el programa y cuales son sus privilegios.

                                    return userName
                                else:

                                    # En caso de que el usuario esté inactivo, no se le da acceso al programa
                                    # y se expulsa al usuario del programa.

                                    print("\nSu cuenta está desactivada, contacte al Jefe de RRHH")
                                    a = input("Presione enter para continuar ")
                                    exit()                                
                            else:

                                # Si el usuario ingresa la contraseña de manera incorrecta, se suma un intento.

                                print("\nContraseña incorrecta")
                                time.sleep(1)
                                intentos += 1
                                continue
                        else:

                            # Si la contraseña no se encontró no se le suma un intento al usuario, ya que
                            # puede deberse a una falla de la base de datos.
                            # Se le pide al usuario intentarlo nuevamente.

                            os.system("cls")
                            print("Por favor, escriba su contraseña")
                            time.sleep(1.5)
                            continue
                            
                else:

                    # Si el usuario erra su contraseña tres veces, el programa se lo informa y
                    # la cuenta del usuario es cambiada a inactiva.

                    os.system("cls")
                    print("Cantidad máxima de intentos excedida. Su cuenta será bloqueada.")
                    time.sleep(5)

                    # Actualización de la tabla empleado para dejar la cuenta inactiva en la base de datos.
                    
                    sql = "update EMPLEADO set ID_ESTADO = 2 where NOMBRE_USUARIO = (%s)"
                    cursor.execute(sql, (userName,))

                    SQLconnector.db.commit()

                    exit()
        
        except KeyboardInterrupt:
            os.system("cls")
            print("Por favor no interrumpa el programa.")
            time.sleep(1)
            print("Reiniciando...")
            time.sleep(0.5)
            os.system("cls")
            continue
        except:
            print("Ha ocurrido un error, se reiniciará el programa")
            time.sleep(1)
            continue

# Función para el jefe de RRHH, en donde puede ver la lista de trabajadores especificada.

def verListaTrabajadores():
    while True:
        # try:
            
            # Selección de los trabajadores según el filtro indicado en los requerimientos

            sql = "select EMPLEADO.ID_GENERO as 'Sexo', EMPLEADO.ID_CARGO as 'Cargo', EMPLEADO.ID_DEPARTAMENTO as 'Departamento', DEPARTAMENTO.ID_AREA as 'Area' from EMPLEADO inner join DEPARTAMENTO on EMPLEADO.ID_DEPARTAMENTO = DEPARTAMENTO.ID"
            cursor.execute(sql)
            result = cursor.fetchall()
            print(result)
            for x in result:
                print(x)

            

        # except:
        #     print("Error")
        #     pass

verListaTrabajadores()