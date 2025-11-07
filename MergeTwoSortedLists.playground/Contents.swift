/* MEZCLA DE DOS LISTAS ENLAZADAS ORDENADAS EN UNA SOLA
 Dados los nodos cabeza de dos listas enlazadas ordenadas list1 y list2, combínalas en una sola lista ordenada uniendo sus nodos existentes (sin crear valores nuevos). Devuelve la cabeza de la lista resultante. Ambas listas están en orden no decreciente, cada valor está entre -100 y 100, y el total de nodos por lista está en [0, 50].
 
Given the head nodes of two sorted linked lists list1 and list2, merge them into one sorted list by splicing together the existing nodes (no new values). Return the head of the merged list. Both lists are non-decreasing, node values range from −100 to 100, and each list has between 0 and 50 nodes. */


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

/// Solución original usando listas enlazadas y recursividad
func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let val1 = list1?.val
    let val2 = list2?.val
    
    guard val1 != nil || val2 != nil else {
        return nil
    }
    
    guard val1 != nil else {
        return list2
    }
    
    guard val2 != nil else {
        return list1
    }
    
    var orderedList = ListNode()
    
    if let v1 = val1, let v2 = val2, v1 == v2 {
        orderedList = ListNode(v1, ListNode(v2))
        orderedList.next?.next = mergeTwoLists(list1?.next, list2?.next)
    } else if let v1 = val1, let v2 = val2, v1 < v2 {
        orderedList.val = v1
        orderedList.next = mergeTwoLists(list1?.next, list2)
    } else {
        orderedList.val = val2 ?? 0
        orderedList.next = mergeTwoLists(list1, list2?.next)
    }
    
    return orderedList
}

/// Pruebas
let sortedList = mergeTwoLists(
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
    ListNode(13,
             ListNode(23,
                      ListNode(24,
                               ListNode(25,
                                        ListNode(26,
                                                 ListNode(29,
                                                          ListNode(35,
                                                                   ListNode(39)
                                                                  )
                                                         )
                                                )
                                       )
                              )
                     )
            )
)

print(sortedList ?? "")
