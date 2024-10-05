import random

# Definir la función de aptitud (fitness function)
def fitness(x):
    return x**2 * x - 1

# Generar una población inicial de individuos con valores aleatorios de x
def generar_poblacion(tamano_poblacion, limites):
    return [random.randint(limites[0], limites[1]) for _ in range(tamano_poblacion)]

# Selección por torneo
def seleccion(poblacion, k=3):
    seleccionados = random.sample(poblacion, k)
    seleccionados.sort(key=lambda x: fitness(x), reverse=True)
    return seleccionados[0]  # El que tenga mejor fitness

# Cruce (crossover): promedio de los padres
def crossover(padre1, padre2):
    return (padre1 + padre2) // 2

# Mutación: cambio aleatorio pequeño
def mutacion(hijo, prob_mutacion=0.1, mut_max=10):
    if random.random() < prob_mutacion:
        return hijo + random.randint(-mut_max, mut_max)
    return hijo

# Algoritmo genético
def algoritmo_genetico(tamano_poblacion, limites, generaciones, prob_mutacion=0.1):
    # Generar la población inicial
    poblacion = generar_poblacion(tamano_poblacion, limites)
    
    # Evolucionar la población durante un número de generaciones
    for generacion in range(generaciones):
        nueva_poblacion = []
        
        for _ in range(tamano_poblacion // 2):  # Producir nuevos hijos (mitad de la población)
            # Selección
            padre1 = seleccion(poblacion)
            padre2 = seleccion(poblacion)
            
            # Cruce
            hijo1 = crossover(padre1, padre2)
            hijo2 = crossover(padre2, padre1)
            
            # Mutación
            hijo1 = mutacion(hijo1, prob_mutacion)
            hijo2 = mutacion(hijo2, prob_mutacion)
            
            # Añadir los hijos a la nueva población
            nueva_poblacion.extend([hijo1, hijo2])
        
        # Reemplazar la población antigua con la nueva
        poblacion = nueva_poblacion
        
        # Imprimir el mejor individuo de la generación
        mejor_individuo = max(poblacion, key=fitness)
        print(f"Generación {generacion+1}: Mejor individuo = {mejor_individuo}, Fitness = {fitness(mejor_individuo)}")
    
    # Devolver el mejor individuo encontrado
    mejor_individuo = max(poblacion, key=fitness)
    return mejor_individuo

# Parámetros del algoritmo genético
tamano_poblacion = 10
limites = (1, 100)  # Rango de valores para x
generaciones = 20
prob_mutacion = 0.1

# Ejecutar el algoritmo genético
mejor_individuo = algoritmo_genetico(tamano_poblacion, limites, generaciones, prob_mutacion)

print(f"\nMejor solución encontrada: x = {mejor_individuo}, Fitness = {fitness(mejor_individuo)}")
-------------------------------------------------------------------------------------------------------------
import random
import pandas as pd

# Definir la función de aptitud (fitness function)
def fitness(x):
    return x**2 * x - 1

# Generar una población inicial de individuos con valores aleatorios de x
def generar_poblacion(tamano_poblacion, limites):
    return [random.randint(limites[0], limites[1]) for _ in range(tamano_poblacion)]

# Selección por torneo
def seleccion(poblacion, k=3):
    seleccionados = random.sample(poblacion, k)
    seleccionados.sort(key=lambda x: fitness(x), reverse=True)
    return seleccionados[0]  # El que tenga mejor fitness

# Cruce (crossover): promedio de los padres
def crossover(padre1, padre2):
    return (padre1 + padre2) // 2

# Mutación: cambio aleatorio pequeño
def mutacion(hijo, prob_mutacion=0.1, mut_max=10):
    if random.random() < prob_mutacion:
        return hijo + random.randint(-mut_max, mut_max)
    return hijo

# Algoritmo genético
def algoritmo_genetico(tamano_poblacion, limites, generaciones, prob_mutacion=0.1):
    # Generar la población inicial
    poblacion = generar_poblacion(tamano_poblacion, limites)
    
    # Datos para el archivo Excel
    resultados = []
    
    # Evolucionar la población durante un número de generaciones
    for generacion in range(generaciones):
        nueva_poblacion = []
        
        for _ in range(tamano_poblacion // 2):  # Producir nuevos hijos (mitad de la población)
            # Selección
            padre1 = seleccion(poblacion)
            padre2 = seleccion(poblacion)
            
            # Cruce
            hijo1 = crossover(padre1, padre2)
            hijo2 = crossover(padre2, padre1)
            
            # Mutación
            hijo1 = mutacion(hijo1, prob_mutacion)
            hijo2 = mutacion(hijo2, prob_mutacion)
            
            # Añadir los hijos a la nueva población
            nueva_poblacion.extend([hijo1, hijo2])
        
        # Reemplazar la población antigua con la nueva
        poblacion = nueva_poblacion
        
        # Guardar el mejor individuo de la generación
        mejor_individuo = max(poblacion, key=fitness)
        resultados.append({
            'Generación': generacion+1,
            'Mejor Individuo': mejor_individuo,
            'Fitness': fitness(mejor_individuo)
        })
    
    # Crear un DataFrame y guardarlo en un archivo Excel
    df_resultados = pd.DataFrame(resultados)
    df_resultados.to_excel('resultados_algoritmo_genetico.xlsx', index=False)

    # Devolver el mejor individuo encontrado
    mejor_individuo = max(poblacion, key=fitness)
    return mejor_individuo

# Parámetros del algoritmo genético
tamano_poblacion = 10
limites = (1, 100)  # Rango de valores para x
generaciones = 20
prob_mutacion = 0.1

# Ejecutar el algoritmo genético
mejor_individuo = algoritmo_genetico(tamano_poblacion, limites, generaciones, prob_mutacion)

print(f"\nMejor solución encontrada: x = {mejor_individuo}, Fitness = {fitness(mejor_individuo)}")
