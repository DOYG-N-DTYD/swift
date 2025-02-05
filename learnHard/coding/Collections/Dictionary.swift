//
//  Dictionary.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 05/02/2025.
//

//Dictionary / Словари

//Словарь (dictionary) представляет собой хранилище, в котором каждый элемент имеет ключ и значение. Разные элементы не могут иметь одинаковые ключи. Все ключи в словаре должны быть уникальными. По ключу мы можем найти элемент в словаре изменить его или удалить.
var phones = ["Apple": "iPhone 6S", "Microsoft": "Lumia 950", "Google": "Nexus X5"]

Здесь словарь называется phones и содержит три элемента. Например, первый элемент: "Apple": "iPhone 6S". "Apple" представляет ключ, а "iPhone 6S" - значение. Причем и ключ, и значение представляют тип String. Но это необязательно.

//Также мы можем явным образом указать тип ключа и значения в словаре:
var phones: [String: String] = ["Apple": "iPhone 6S", "Microsoft": "Lumia 950", "Google": "Nexus X5"]

//Либо также можно использовать полное определение типа:
var phones: Dictionary<String, String> = ["Apple": "iPhone 6S", "Microsoft": "Lumia 950", "Google": "Nexus X5"]

//Создание пустого словаря:
var phones: Dictionary<String, String> = [:]
 
//Пустой словарь альтернативный вариант
var phones2: [String: String] = [:]
 
//Пустой словарь с использованием инициализатора
var phones3 = [String: String]()

//Проверка пустой ли словарь
var phones: Dictionary<String, String> = [:]
 
if phones.isEmpty {
    print("Словарь phones пуст")
} else {
    print("В словаре phones есть элементы")
}

//Чтобы определить число элементов в словаре, можно использовать свойство count:
var phones: [String: String] = ["Apple": "iPhone 6S", "Microsoft": "Lumia 950", "Google": "Nexus X5"]
print(phones.count)

//Используя ключ элемента, мы можем обратиться к этому элементу в словаре, получить его или изменить:
var phones: [String: String] = ["Apple": "iPhone 6S", "Microsoft": "Lumia 950", "Google": "Nexus X5"]

// получение элемента по ключу
print(phones["Apple"])      // iPhone 6S
// изменение элемента
phones["Apple"] = "iPhone 5SE"
//Альтернативой подобному изменению элемента в словаре является метод updateValue:
phones.updateValue("iPhone 5SE", forKey: "Apple")
print(phones["Apple"])      // iPhone 5SE

//Для удаления элемента из словаря достаточно ему присвоить значение nil:
phones["Google"] = nil
//Либо можно использовать метод removeValue(), который с помощью параметра forKey принимает ключ удаляемого элемента:
phones.removeValue(forKey: "Google")
//Метод removeValue() возвращает значение удаляемого объекта, если объекта с таким ключом в словаре нет, то возвращается nil:
if let removedValue = phones.removeValue(forKey: "Google") {
    print("Удален объект \(removedValue).")
} else {
    print("Словарь не содержит удаляемого элемента")
}

//Перебор словаря
//Для перебора словаря используется стандартный цикл for-in:

var phones: [String: String] = ["Apple": "iPhone 6S", "Microsoft": "Lumia 950", "Google": "Nexus X5"]
for (manufacturer, model) in phones {
    print("\(manufacturer): \(model)")
}
//При переборе каждый объект словаря возвращается в виде кортежа (key, value), в котором первый элемент представляет ключ, а второй - значение.

//Можно отдельно перебирать ключи и значения. Перебор ключей:
for manufacturer in phones.keys {
    print(manufacturer)
}
//Перебор значений:
for model in phones.values {
    print(model)
}

//Создание словаря из массивов
//С помощью встроенной глобальной функции zip() можно соединить два массива в объект Zip2Sequence, который затем передается в инициализатор типа Dictionary:
let countries = ["Iran", "Iraq", "Syria", "Lebanon"]
let capitals = ["Tehran", "Bagdad", "Damascus", "Beirut"]
var seq = zip(countries, capitals)
 
var dict = Dictionary(uniqueKeysWithValues:seq)
for (key, value) in dict {
    print("\(key) - \(value)")
}
//В данном случае каждый элемент из массива countries последовательно сопоставляется с соответствующим элементом из массива capitals. Затем результат через параметр uniqueKeysWithValues передается в инициализатор Dictionary. И таким образом образуется словарь. Результат программы:
//
//Iran - Tehran Iraq - Bagdad Syria - Damascus Lebanon - Beirut
//Стоит учитывать, что если у нас в обоих массивах есть повторяющиеся значения, то подобный способ их объединения завершится с ошибкой, ведь в словаре все ключи должны быть уникальными. И для этого надо использовать другую форму инициализатора Dictionary:
let countries = ["Iran", "Iraq", "Syria", "Lebanon", "Iran"]
let capitals = ["Tehran", "Bagdad", "Damascus", "Beirut", "Tehran"]
var seq = zip(countries, capitals)
 
var dict = Dictionary(seq, uniquingKeysWith:{return $1})
 
for (key, value) in dict {
    print("\(key) - \(value)")
}
//В данном случае в инициализатор в качестве первого параметра опять же передается объединенные последовательности. А второй параметр uniquingKeysWith указывает на функцию, которая получает все значения из второго массива, которые соответствуют повторяющемуся ключу. В нашем случае это два элемента. И затем нам надо возвратить какой-нибудь результат. Здесь просто возвращается значение второго параметра.
