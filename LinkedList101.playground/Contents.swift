/// Descomentar el código que queramos probar.

// Ejemplo de creación y conexión de nodos.
//let node1 = Node(value: 13)
//let node2 = Node(value: 39)
//let node3 = Node(value: 70)
//
//node1.next = node2
//node2.next = node3
//
//print(node1)

// - - -

// Ejemplo de operación push de la lista
//var list = LinkedList<Int>() // Creamos una lista vacía que reciba enteros.
//list.push(1)
//list.push(2)
//list.push(3)
//
//print(list)

// - - -

// Ejemplo de operación append de la lista
//var list = LinkedList<Int>()
//list.append(1)
//list.append(2)
//list.append(3)
//
//print(list)

// - - -

// Ejemplo de insertar nodo después de otro
var list = LinkedList<Int>()
list.push(1)
list.push(2)
list.push(3)

print("Lista antes de insertar nodo: \(list)")

if let middleNode = list.node(at: 1) {
    list.insert(10, after: middleNode)
}

print("Lista después de insertar nodo: \(list)")




