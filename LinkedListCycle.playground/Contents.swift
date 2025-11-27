/* LISTA CIRCULAR (LISTA SIMPLEMENTE ENLAZADA CON UN CICLO)
Dada la cabeza de una lista enlazada, determina si contiene un ciclo, es decir, si algún nodo puede ser alcanzado nuevamente siguiendo continuamente los punteros next. Retorna true si existe un ciclo, de lo contrario false. La lista puede tener entre 0 y 10^4 nodos, con valores entre -10^5 y 10^5.

Given the head of a linked list, determine if it contains a cycle, meaning whether some node can be reached again by continuously following the next pointers. Return true if a cycle exists, otherwise false. The list may contain 0 to 10^4 nodes with values between -10^5 and 10^5. */

/// Clase dada por LeetCode
public class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public var description: String {
        guard let next else { return "\(val)" }
        return "\(val) -> " + String(describing: next) + " "
    }
}

/// Solución original
func hasCycle(_ head: ListNode?) -> Bool {
    // Creamos los nodos del algoritmo de la liebre y la tortuga
    var slowNode = head
    var fastNode = head
    // Validamos los casos en los que haya cero, uno o dos nodos.
    guard head != nil else { return false }
    guard head?.next != nil else { return false }
    guard head?.next?.next != nil else { return false }
    // Implementamos el algoritmo de la liebre y la tortuga
    while slowNode != nil && fastNode != nil {
        slowNode = slowNode?.next
        fastNode = fastNode?.next?.next
        // Si vuelven a coincidir en el mismo nodo (comparado por referencia), hay un ciclo
        if slowNode === fastNode { return true }
    }
    return false
}

/// Las pruebas no se pueden realizar en playground, porque requieren de un parámetro "pos" que determina el resultado, y se requiere agregar el nodo next de tail al nodo en la posición "pos" para poder evaluar esto.
