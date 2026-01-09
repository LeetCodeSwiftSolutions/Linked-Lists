/* ELIMINAR DUPLICADOS DE UNA LISTA SIMPLEMENTE ENLAZADA ORDENADA.
Dada la cabeza de una lista enlazada ordenada, elimina todos los nodos que sean duplicados de modo que cada valor aparezca una sola vez, y devuelve la lista resultante igualmente ordenada. Por ejemplo, de [1,1,2] se obtiene [1,2] y de [1,1,2,3,3] se obtiene [1,2,3]. La lista puede tener entre 0 y 300 nodos, los valores de los nodos están entre -100 y 100, y la lista ya viene ordenada de forma ascendente.

Given the head of a sorted linked list, remove all duplicate nodes so that each value appears only once, and return the resulting sorted list. For example, [1,1,2] becomes [1,2] and [1,1,2,3,3] becomes [1,2,3]. The list length is between 0 and 300 nodes, node values range from -100 to 100, and the input list is guaranteed to be sorted in ascending order.
 */


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
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    // Consideramos el caso en que la lista sea nula
    if head == nil { return nil }
    // Creamos los nodos head y tail para nuestra solución
    var newHead: ListNode? = ListNode(head!.val)
    var newTail: ListNode? = newHead
    // Nombramos al nodo sobre el que vamos a iterar, currentNode
    var currentNode: ListNode? = head!.next
    
    // Iteramos hasta que el currentNode sea distinto de nil
    while currentNode != nil {
        // Solamente cuando el valor del nodo sea distinto al del tail, agregamos un nuevo nodo en next.
        if newTail!.val != currentNode!.val {
            newTail!.next = ListNode(currentNode!.val)
            newTail = newTail!.next
        }
        currentNode = currentNode!.next
    }

    return newHead
}

/// Solución original, con mejor manejo de nodos. Time complexity: O(n), Space complexity: O(1). Beats 100% & 18%
func deleteDuplicatesOptimized(_ head: ListNode?) -> ListNode? {
    // Handle edge cases
    guard head != nil else { return nil }
    // We'll use two pointers
    let result = head
    var current = head!.next // current filters repeated nodes and iterates through the list
    var trail = head // trail is the last node of the result list
    // Iterate through the entire list with current
    while current != nil {
        // If equal, move current forward and disconnect from trail
        if trail!.val == current!.val {
            trail!.next = nil
        } else { // If different, connect trail to current and move both forward
            trail!.next = current
            trail = current
        }
        current = current!.next
    }
    return result
}

/// Test cases
deleteDuplicatesOptimized(
    ListNode(1,
             ListNode(3,
                      ListNode(4,
                               ListNode(4,
                                        ListNode(23,
                                                 ListNode(23,
                                                          ListNode(30)
                                                         )
                                                )
                                       )
                              )
                     )
            )
)

deleteDuplicatesOptimized(nil)
