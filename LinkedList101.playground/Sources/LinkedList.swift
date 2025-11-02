//
//  LinkedList.swift
//  
//
//  Created by José Miguel Torres Chávez Nava on 31/10/25.
//

public struct LinkedList<Value>: CustomStringConvertible {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    // La descripción de la lista usa la descripción recursiva del nodo.
    public var description: String {
        guard let head else {
            return "Empty list"
        }
        return String(describing: head)
    }
    
    // Método para agregar nodos al inicio de la lista (head-first insertion)
    public mutating func push(_ value: Value) {
        // Creamos el nuevo nodo como la cabeza, y el next de esa nueva cabeza, es la cabeza de la lista anterior.
        head = Node(value: value, next: head)
        if tail == nil { // Si la tail es nil, era una lista vacía y actualizamos tail con el valor de head (son el mismo nodo)
            tail = head
        }
    }
    
    // Método para agregar nodos al final de la lista (tail-end insertion)
    public mutating func append(_ value: Value) {
        // Primero desenvolvemos el último nodo, en caso de que exista.
        if let last = tail {
            last.next = Node(value: value) // Actualizamos la referencia del tail anterior, con el nuevo nuevo.
            tail = last.next // Actualizamos el tail con el nuevo nodo que enlazamos.
        } else {
            // En caso de que no se haya podido desenvolver el último nodo, quiere decir que la lista estaba vacía
            push(value)
        }
    }
    
    // Método para encontrar el nodo en un índice dado (o regresa nil si la lista es vacía o se sobrepasa el índice)
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next // current node nunca va a ser nil, pero su "next" si puede ser nil, y eso no causa crash con el !
            currentIndex += 1
        }
        
        return currentNode
    }
    
    
    // Método para insertar un nuevo nodo después de haber encontrado el nodo en un índice en particular
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        // Si el método insert se llama sobre el nodo tail, se usa el método append.
        guard tail !== node else {
            append(value)
            return tail!
        }
        // Si se llama sobre cualquier otro nodo, cambiamos el nodo "next" de ese nodo, y al nuevo nodo, le ponemos como next, el que ya estaba como next en el nodo original.
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
}
