/* ELIMINAR NODOS DE UNA LISTA ENLAZADA CON UN VALOR BUSCADO
Dada la cabeza de una lista enlazada y un valor entero val, elimina todos los nodos cuyo valor sea igual a val y retorna la nueva cabeza. La lista puede tener de 0 a 10⁴ nodos, y los valores de nodos y val están entre 0 y 50.

Given the head of a linked list and an integer val, remove all nodes with value equal to val and return the new head. The list may contain 0 to 10⁴ nodes, and both node values and val range from 0 to 50. */


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
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    // Necesitamos el nodo head variable por si el valor repetido se encuentra en el primer nodo
    var head = head
    // Usaremos dos punteros para recorrer la lista
    var currentNode: ListNode? = head
    var previousNode: ListNode? = nil

    // Repetimos el proceso hasta terminar la lista
    while currentNode != nil {
        // Desenvolvemos el valor del nodo y lo comparamos
        if let checkValue = currentNode?.val, checkValue == val {
            // Si el nodo actual es la cabeza, recorremos la cabeza
            if currentNode === head {
                head = currentNode?.next
            } else { // De lo contrario, recortamos el nodo nada más
                previousNode?.next = currentNode?.next
            }
        } else {
            // Si no era el nodo buscado, solo asignamos el nodo previo
            previousNode = currentNode
        }
        // En todos los casos, tenemos que avanzar el nodo actual
        currentNode = currentNode?.next
    }
    return head
}


/// Pruebas
print(removeElements(
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
    30
) as Any)
