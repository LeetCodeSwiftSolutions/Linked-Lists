/* ELIMINAR EL N-ÉSIMO NODO DESDE EL FINAL DE UNA LISTA SIMPLEMENTE ENLAZADA.
Dada la cabeza de una lista enlazada, elimina el n-ésimo nodo desde el final de la lista y retorna la nueva cabeza. El número de nodos está entre 1 y 30, los valores de nodos entre 0 y 100, y n está entre 1 y el tamaño de la lista.

Given the head of a linked list, remove the nth node from the end of the list and return the new head. The number of nodes ranges from 1 to 30, node values are between 0 and 100, and n is between 1 and the list size. */


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
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    // Variables para modificar head y recorrer el nodo
    var head: ListNode? = head
    var nodeCount = 0
    var currentNode: ListNode? = head
    // Primero obtenemos el número de nodos
    while currentNode != nil {
        nodeCount += 1
        currentNode = currentNode?.next
    }
    // Ahora definimos el target node para eliminarlo
    let targetNode = nodeCount - n + 1
    var currentPos = 1
    currentNode = head
    // Si la posición a eliminar es la primera, solo actualizamos head
    guard targetNode != 1 else {
        head = head?.next
        return head
    }
    // Si el target no se encuentra dentro de los límites, regresamos head
    guard targetNode > 1 else { return head }
    // Nos posicionamos sobre el nodo anterior al target
    while currentPos != targetNode - 1 {
        currentNode = currentNode?.next
        currentPos += 1
    }
    // Eliminamos la conexión con el nodo
    currentNode?.next = currentNode?.next?.next
    return head
}


/// Pruebas
print(removeNthFromEnd(
    ListNode(1,
             ListNode(3,
                      ListNode(4,
                               ListNode(7,
                                        ListNode(9,
                                                 ListNode(23,
                                                          ListNode(30)
                                                         )
                                                )
                                       )
                              )
                     )
            ),
    1
) as Any)
