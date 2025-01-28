//
//  Set.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 28/01/2025.
//

//Множества (Set) представляют собой неупорядоченные коллекции уникальных элементов. В отличие от массивов в множествах элементы должны быть уникальными, мы не можем определить несколько элементов с одним и тем же значением.
//Определение
//Для определения множества у переменной или константы устанавливается тип Set<Element>, где Element - это тип данных:

var numbers: Set<Int> = [5, 6, 7, 8]
//При определении можно опускать тип:

var numbers: Set = [5, 6, 7, 8]
//Либо можно использовать функцию инициализатора Set<Element>:

var numbers = Set<Int>(arrayLiteral: 5, 6, 7, 8)
//Создание пустого множества:

var numbers = Set<Int>()
// или
// var numbers: Set<Int> = []

//Работа с множествами
//Метод insert() позволяет добавить новый элемент в множество:
var numbers: Set<Int> = [5, 6, 7, 8]
numbers.insert(10);
print(numbers)  // [5, 6, 7, 8, 10]

removeAtIndex()//: удаляет элемент по определенному индексу

removeFirst()//: удаляет первый элемент

remove()//: удаляет какой-то определенный элемент по значению

removeAll()//: удаляет все элементы

var numbers: Set<Int> = [5, 6, 7, 8]
numbers.remove(7);
print(numbers)  // [5, 6, 8]
//Еще один метод contains() позволяет проверить наличие в множестве элемента:

var numbers: Set<Int> = [5, 6, 7, 8]
var isPresent = numbers.contains(7);    // true - элемент есть
isPresent = numbers.contains(34);   // false - элемент отсутствует
//Хотя множество представляет неупорядоченный набор, но с помощью метода sorted() мы можем отсортировать его:

var numbers: Set<Int> = [4, 7, 2, 6]
print(numbers.sorted()) // [2, 4, 6, 7]

//Операции над множествами

//Особую ценность среди операций представляют операции, предназначенные специально для множеств: объединение, пересечение, разность множеств.
//Операции над множествами в Swift
//intersection(): пересечение множеств, возвращает общие для обоих множеств элементы в виде нового множества
//symmetricDifference(): возвращает не общие (не пересекающиеся) для обоих множеств элементы (симметрическая разность) в виде нового множества
//union(): возвращает объединение двух множеств в виде нового множества
//subtract(): оставляет в первом множестве только те элементы, которых нет во втором
//subtracting(): также выполняет разницу множеств, только результат возвращается в виде нового множества

var a: Set = [1, 2, 3, 4, 5]
var b: Set = [4, 5, 6, 7, 8]
 
// объединение
var union = a.union(b)
print(union)  // [2, 5, 4, 7, 1, 6, 8, 3]
// пересечение
var intersection = a.intersection(b)
print(intersection)       // [4, 5]
 
// симметрическая разность
var difference = a.symmetricDifference(b)
print(difference)  // [8, 1, 3, 6, 2, 7]
 
// разность
var subtracting = a.subtracting(b)
print(subtracting)  // [3, 2, 1]
 
// разность
a.subtract(b)
print(a)   // [1, 2, 3]
