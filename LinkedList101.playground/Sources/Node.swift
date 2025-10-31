//
//  Node.swift
//  
//
//  Created by José Miguel Torres Chávez Nava on 31/10/25.
//

/// Clase para crear nodos. Adopta el protocolo de StringConvertible para poder tener una representación personalizada en formato de texto.
public class Node<Value>: CustomStringConvertible {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    // Función recursiva para mostrar toda la lista en su representación de cadena.
    public var description: String {
        guard let next else {
            return "\(value)"
        }
        // En String(describing: next) llama a next.description para imprimir recursivamente todos los nodos de la lista.
        return "\(value) -> " + String(describing: next) + " "
    }
}
