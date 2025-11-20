/* SUMAR DOS NÚMEROS QUE PROVIENEN DE LISTAS SIMPLEMENTE ENLAZADAS
 Se dan dos listas ligadas no vacías que representan enteros no negativos, con dígitos en orden inverso y un dígito por nodo. Suma ambos números y devuelve la suma como otra lista ligada en el mismo formato, propagando el acarreo cuando sea necesario y manejando longitudes distintas. Ejemplo: [2,4,3] + [5,6,4] → [7,0,8] (342 + 465 = 807). Restricciones: cada lista tiene de 1 a 100 nodos, 0 ≤ Node.val ≤ 9, sin ceros a la izquierda salvo el número 0.

 You are given two non-empty linked lists representing non-negative integers, with digits stored in reverse order and one digit per node. Add the two numbers and return the sum as a linked list in the same format, carrying over as needed and handling different lengths. Example: [2,4,3] + [5,6,4] → [7,0,8] (342 + 465 = 807). Constraints: each list has 1 to 100 nodes, 0 ≤ Node.val ≤ 9, no leading zeros except for the number 0. */


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
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    // Comenzamos adquiriendo los valores de cada nodo en esta llamada, la 1er llamada es a los valores de head, que son las cifras de unidades en el número.
    let val1 = l1?.val
    let val2 = l2?.val
    // Si cualquiera de los dos es distinto a nil, se continúa con el cálculo, si no (ambos son nil), se retorna nil
    guard val1 != nil || val2 != nil else {
        return nil
    }
    // Calculamos la suma de los valores (opcionales) y calculamos el módulo sobre 10.
    let sum = (val1 ?? 0) + (val2 ?? 0)
    let digit = sum % 10
    // El nodo siguiente se calcula
    let l1Next: ListNode? = {
        // Si sum - digit == 0 significa que la suma no supero las 10 unidades.
        if sum - digit != 0 {
            let aux = l1?.next ?? ListNode(0) // Guardamos el siguiente nodo de la lista o agregamos un cero si ya se acabaron
            aux.val += 1 // Aumentamos en una unidad el valor del nodo siguiente, porque superó las 10 unidades.
            return aux
        } else {
            return l1?.next // La suma no superó las 10 unidades
        }
    }()
    // El nodo actual se manda aquí (es el primero de la suma en head.)
    let node = ListNode(digit) // Guardamos la suma del orden de unidades correspondientes, creando un nuevo nodo.
    node.next = addTwoNumbers(l1Next, l2?.next) // Volvemos a llamar a la función para que continúe de manera recursiva, hasta que ambos nodos sean nulos.
    return node // Este nodo contendrá el resultado final después de todas las iteraciones de la función recursiva.
}

/// Pruebas
print(addTwoNumbers(ListNode(2, ListNode(4, ListNode(3))), ListNode(5, ListNode(6, ListNode(4)))))


/// Solución pendiente por analizar, con más experiencia (50+ ejercicios resueltos)
//class Solution {
//    private var dig = 0
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        if l1 == nil && l2 == nil && dig == 0 { return nil }
//        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + dig
//        dig = sum / 10
//        return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))
//    }
//}



