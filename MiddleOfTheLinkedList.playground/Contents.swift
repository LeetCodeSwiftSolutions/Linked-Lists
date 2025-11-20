/* NODO CENTRAL DE UNA LISTA SIMPLEMENTE ENLAZADA
 Dada la cabeza de una lista simplemente enlazada, devuelve el nodo medio; si hay dos nodos medios, devuelve el segundo. En el formato del problema, se retorna la sublista que inicia en ese nodo. Ejemplos: [1,2,3,4,5] → [3,4,5]; [1,2,3,4,5,6] → [4,5,6]. Restricciones: número de nodos entre 1 y 100, valores de nodo entre 1 y 100.
 
 Given the head of a singly linked list, return the middle node; if there are two middle nodes, return the second one. In this problem’s format, you return the sublist starting at that node. Examples: [1,2,3,4,5] → [3,4,5]; [1,2,3,4,5,6] → [4,5,6]. Constraints: number of nodes in [1,100], node values in [1,100]. */


/// Clase dada por Leetcode
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
func middleNode(_ head: ListNode?) -> ListNode? {
    var count = 0
    var currentNode: ListNode? = head
    
    while currentNode != nil {
        currentNode = currentNode!.next
        count += 1 // Este suma 1 en el nodo final también.
    }
    
    var index = count/2
    count = 0
    currentNode = head
    
    while currentNode != nil && count != index {
        currentNode = currentNode!.next
        count += 1
    }
    
    return currentNode
}

/// Pruebas
print(middleNode(ListNode(13, ListNode(22, ListNode(81, ListNode(9))))))


/// Solución optimizada
//func middleNode(_ head: ListNode?) -> ListNode? {
//    var slowPointer = head
//    var fastPointer = head
//    
//    while fastPointer != nil && fastPointer?.next != nil {
//        slowPointer = slowPointer?.next
//        fastPointer = fastPointer?.next?.next
//    }
//    
//    return slowPointer
//}
