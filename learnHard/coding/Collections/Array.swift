//
//  Array.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 28/01/2025.
//


// Полная форма
//var имяМассива: Array<Тип>

// Краткая форма
//var имяМассива: [Тип]

//доступ к элементам массива по индексу

//можно присвоить значения через последовательности
var numbers = [5, 6, 7, 8, 3]
numbers[1...3] = [105, 106, 103]
print(numbers)  // 5, 105, 106, 103, 3

numbers.count //количество элементов массива
numbers.isEmpty //пустой ли массив


//###################################################################################################
//перебор массива
//ЦИКЛ
var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
 
for i in numbers {
    print(i) // 1, 2, 3, 4, 5, 6, 7, 8,
}

//ИНДЕКСЫ
var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
 
for i in 0 ..< numbers.count {
    print(numbers[i]) // 1, 2, 3, 4, 5, 6, 7, 8,
}

//###################################################################################################
//FOR_EACH  ENUMERATED
var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
numbers.forEach({print($0)})

//сразу получить ключ и значение
var names: [String] = ["Tom", "Alice", "Kate"]
names.enumerated().forEach({print("\($0) - \($1)")})
for (index, value) in names.enumerated() {
    print("\(index) - \(value)")
}

//###################################################################################################=
//Создание массива из последовательности
//Специальная форма инициализатора в качестве параметра принимает последовательность, из которой создается массив:

var numbers = Array (1...5)     // [1, 2, 3, 4, 5]
var numbers2 = [Int] (3..<7)    // [3, 4, 5, 6]
 
print(numbers)   // [1, 2, 3, 4, 5]
print(numbers2)   // [3, 4, 5, 6]

//Еще одна форма инициализатора позволяет инициализировать массив определенным числом элементов одного значения:
var numbers = [Int] (repeating: 5, count: 3)
// или так
var numbers2 = Array (repeating: 5, count: 3)
// эквивалентно массиву var numbers: [Int] = [5, 5, 5]
print(numbers)   // [5, 5, 5]
//Однако стоит учитывать, что если подобным образом создается массив из объектов классов - ссылочных типов, то все элементы массива будут хранить ссылку на один и тот же элемент в памяти:
class Person{
    var name: String
    init(name: String){
        self.name = name
    }
}
let tom = Person(name: "Tom")
 
var people = Array (repeating: tom, count: 3)
 
people[0].name = "Bob"
 
for person in people{
    print(person.name)
}
 
// Bob
// Bob
// Bob



//###################################################################################################=
//Сравнение массивов
// == массивы равные если все элементы массива идентичны

//Копирование массива
//Массив является значимым типом, поэтому при копировании одного массива в другой второй массив получает копию первого:

var numbers: [Int] = [1, 2, 3, 4, 5]
var nums: [Int] = numbers
 
nums[0] = 78
 
print(numbers)      // [1, 2, 3, 4, 5]
print(nums)         // [78, 2, 3, 4, 5]
//С помощью последовательности можно задать набор индексов, по которым элементы копируются в другой массив:

var numbers: [Int] = [1, 2, 3, 4, 5]
var nums = numbers[1...3]
 
print(nums[1])      // 2
print(nums)         // [2, 3, 4]
//В данном случае в массив nums копируются элементы из numbers с 1 по 3 индексы. При этом первым индексом в массиве nums будет не 0, а 1, так как именно с этого индекса производится копирование из numbers.

//###################################################################################################=
//Добавление в массив
//Для добавления элемента в массив применяется метод append():

var numbers  = [8, 11, 13, 14]
numbers.append(20)
print(numbers)  // 8, 11, 13, 14, 20
//Другой метод insert() управляет вставкой элемента в определенное место массива:

var numbers = [8, 11, 13, 14]
numbers.insert(10, at: 3)   // вставка числа 10 на 3-й индекс
print(numbers)  // 8, 11, 13, 10, 14

//###################################################################################################=
//Удаление из массива

//Ряд операций позволяют удалять элемент:

//remove(at: index): удаляет элемент по определенному индексу

//removeFirst(): удаляет первый элемент

//removeLast(): удаляет последний элемент

//dropFirst(): удаляет первый элемент

//dropLast(): удаляет последний элемент

//removeAll(): удаляет все элементы массива

var numbers = [8, 11, 13, 14]
numbers.remove(at: 2)   // удаляем 3-й элемент
print(numbers)  // 8, 11, 14
//Разница между методами removeFirst/removeLast и dropFirst/dropLast заключается в том, что первые возвращают удаленный элемент, а вторые - модифицированный массив:

var numbers = [8, 11, 13, 14]
var n = numbers.removeFirst() // 8
var subNumbers = numbers.dropFirst()
print(subNumbers)   // [13, 14]
//И если из массива необходимо удалить все элементы, применяется метод removeAll():

var numbers = [8, 11, 13, 14]
numbers.removeAll()
print(numbers)   // []

//###################################################################################################=
//Сортировка массива
//Для сортировки массива применяется метод sort:

var numbers: [Int] = [10, 4, 12, 1, 3]
numbers.sort()
print(numbers)  // [1, 3, 4, 10, 12]
//Если метод sort сортирует оригинальный массив, то метод sorted() возвращает новый отсортированный массив, никак не изменяя старый:

var numbers: [Int] = [10, 4, 12, 1, 3]
 
var nums = numbers.sorted()
print(nums)     // [1, 3, 4, 10, 12]
//Обе функции принимают параметр by, который задает принцип сортировки. Он представляет функцию, которая принимает два параметра. Оба параметра представляют тип элементов массива. На выходе функция возвращает объект Bool. Если это значение равно true, то первое значение ставится до второго, если false - то после.

var numbers: [Int] = [10, 4, 12, 1, 3]
numbers.sort(by: {$0 > $1})
print(numbers)  // [12, 10, 4, 3, 1]
 
var nums = numbers.sorted(by: <)
print(nums)     // [1, 3, 4, 10, 12]
//Выражение {$0 > $1} представляет анонимную функцию, которая возвращает true, если значение первого параметра меньше второго, то есть в данном случае сортировка в обратном порядке. Мы можем задать более сложную логику, но в данном случае мы просто сравниваем два значения, поэтому мы можем упрастить данный вызов: numbers.sort(by: >) и Swift опять же будет применять операцию > к обоим параметрам.

//###################################################################################################=
//Объединение массивов
//С помощью операции сложения можно объединить два однотипных массива:
var numbers1 = [5, 6, 7]
var numbers2 = [1, 2, 3]
var numbers3 = numbers1 + numbers2
print(numbers3) // 5, 6, 7, 1, 2, 3

//###################################################################################################=
//Фильтрация массивов

//Для фильтрации массива применяется метод filter(), который возвращает отфильтрованный массив. В качестве параметра метод принимает функцию - если перебирает все эелементы и возвращает значение типа Bool. Если это значение - true, то элемент попадает в отфильтрованный массив:

var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
 
var filteredNums = numbers.filter({$0 % 2==0})
print(filteredNums) // [2, 4, 6, 8]
//В данном случае метод filter принимает анонимную функцию, которая возвращает результат условия $0 % 2==0, то есть если число делится на 2 без остатка (четное), то оно попадает в отфильтрованный массив.
//
//Еще один способ фильтрации представляет метод prefix(). Он также возвращает отфильтрованный массив, при этом он перебирает подряд все элементы, пока условие возвращает true. Условие задается с помощью параметра while, который представляет функцию, возвращающую значение Bool:

var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
 
var filteredNums = numbers.prefix(while: {$0 < 5})
print(filteredNums) // [1, 2, 3, 4]

//В данном случае пока истинно условие $0 < 5, то есть пока элементы массива меньше 5, они будут попадать в отфильтрованный массив.
//Противоположным образом работает метод drop() - он, наоборт, удаляет все элементы до того, пока они не станут соответствовать условию:

var numbers: [Int] = [1, 2, 5, 3, 4, 5, 6, 7, 8]
 
var filteredNums = numbers.drop(while: {$0 < 5})
print(filteredNums) // [5, 3, 4, 5, 6, 7, 8]
//Причем удаляются именно первые элементы, пока не найдется элемент, который удовлетворяет условию.

//###################################################################################################=
//Преобразование массива

//Метод map() проходит по всем элементам массива и преобразует их с помощью функции, которая передается в качестве параметра и которая возвращает преобразованный элемент. Преобразованные элементы помещаются в новый массив, который возвращается методом map:

var numbers: [Int] = [1, 2, 5, 3, 4, 5, 6, 7, 8]
 
var mapedNums = numbers.map({$0 * $0})
print(mapedNums) // [1, 4, 25, 9, 16, 25, 36, 49, 64]
//В данном случае метод map принимает анонимную функцию, которая возвращает квадрат числа. В итоге созданный массив будет содержать квадраты чисел из оригинального массива.

//###################################################################################################=
//Многомерные массивы
var table = [[1,2,3], [4,5,6], [7,8,9]]
 
// получаем вторую строку
var row2 = table[1]  // [4,5,6]
 
// получаем первый элемент второй строки
var cell1 = row2[0]  // 4
 
// получаем второй элемент первой строки
var cell2 = table[0][1] // 2
//Внутри массива у нас три подмассива. Фактически данный массив можно представить как таблицу, в которой 3 строки. Выражение table[1] позволяет получить второй элемент - второй подмассив. А выражение row2[0] возвращает первый элемент этого подмассива.
//Либо мы можем использовать набор квадратных скобок для доступа к элементам внутри подмассивов: table[0][1]
//Подобным образом можно изменять элементы массива

// изменим вторую строку
table[1] = [16, 25, 36]
 
// изменим второй элемент первой строки
table[0][1] = -12
//При переборе стоит учитывать, что поскольку каждый элемент многомерного массива сам является массивом, то мы можем организовать вложенные циклы для их перебора:

// перебор по строкам
for row in table{
    print(row)
}
 
// перебор таблицы по строкам и столбцам
for row in table{
    for cell in row{
        print(cell)
    }
}
