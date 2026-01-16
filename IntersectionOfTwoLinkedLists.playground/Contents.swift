/* 160. Intersection of Two Linked Lists [Easy]
Dadas las cabezas de dos listas enlazadas simples headA y headB, encuentra el nodo donde ambas listas se intersectan. Si no hay intersección, devuelve null. Las listas no contienen ciclos y deben conservar su estructura original. El número de nodos en cada lista está entre 1 y 3×10⁴, y los valores de los nodos entre 1 y 10⁵

Given the heads of two singly linked lists headA and headB, find the node at which the two lists intersect. If there is no intersection, return null. The lists contain no cycles and must retain their original structure. The number of nodes in each list ranges from 1 to 3×10⁴, and node values are between 1 and 10⁵ */

/// LeetCode class definition.
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

/// Original Solution. Time Complexity: O(m+n), Space Complexity: O(1). Beats 27% & 25%
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var pointerA = headA
    var pointerB = headB
    var isPointerAInListA = true
    var isPointerBInListB = true
    // Two-pointer technique: traverse both lists, switching heads at the end to align lengths
    while (pointerA != nil) || (pointerB != nil) {
        if pointerA === pointerB {
            return pointerA // Intersection found
        }
        pointerA = pointerA!.next
        pointerB = pointerB!.next
        // Switch to the other list if reaching the end (only once per list)
        if pointerA == nil && isPointerAInListA {
            pointerA = headB
            isPointerAInListA = false
        }
        if pointerB == nil && isPointerBInListB {
            pointerB = headA
            isPointerBInListB = false
        }
    }
    return nil
}

/// Tests cases require custom judge from LeetCode.
