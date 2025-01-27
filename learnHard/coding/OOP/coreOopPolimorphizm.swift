//
//  coreOopPolimorphizm.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 27/01/2025.
//

//Полиморфизм представлять возможность взаимозаменяемости типов, которые находятся в одной иерархии классов. Например, возьмем следующую иерархию классов:

class Person{
    var name: String
    var age: Int
             
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    func display(){
        print("Имя: \(name)  Возраст: \(age)")
    }
}
         
class Employee : Person{
    var company: String
    init(name: String, age: Int, company: String) {
        self.company = company
        super.init(name:name, age: age)
    }
    override func display(){
        print("Имя: \(name)  Возраст: \(age)  Сотрудник компании: \(company)")
    }
}
         
class Manager : Employee{
    override func display(){
        print("Имя: \(name)  Возраст: \(age)  Менеджер компании: \(company)")
    }
}
//В данном случае класс Manager (менеджер компании) наследуется от класса Employee (сотрудник компании), а класс Employee - от класса Person (человек). Тем самым класс Manager ненапрямую тоже наследуется от Person.
//Поскольку и сотрудник компании и менеджер компании в то же время являются людьми, то есть объектами класса Person, то мы можем написать следующим образом:
//
let tom: Person = Person(name:"Tom", age: 23)
let bob: Person = Employee(name: "Bob", age: 28, company: "Apple")
let alice: Person = Manager(name: "Alice", age: 31, company: "Microsoft")
//Все три константы представляют тип Person, однако первая хранит ссылку на объект Person, вторая - на объект Employee, а третья - на объект Manager. Таким образом, переменная или константа одного типа может принимать многообразные формы в зависимости от конкретного объекта, на который она указывает.
//
//Но что будет, если мы вызовем метод display() для всех трех объектов:

let tom: Person = Person(name:"Tom", age: 23)
let bob: Person = Employee(name: "Bob", age: 28, company: "Apple")
let alice: Person = Manager(name: "Alice", age: 31, company: "Microsoft")
         
tom.display()       // Имя: Tom  Возраст: 23
bob.display()       // Имя: Bob  Возраст: 28  Сотрудник компании: Apple
alice.display()     // Имя: Alice  Возраст: 31  Менеджер компании: Microsoft
//Несмотря на то, что все три константы представляют тип Person, при вызове метода display будет вызываться реализация метода именно того класса, ссылку на объект которого хранит константа. Данный примем называется динамической диспетчеризацией - во время выполнения программы на основании типа объекта система решает, какую именно реализацию метода вызывать. В одной стороны, это нам дает ряд преимуществ - мы можем работать с объектом производного типа как с объектом базового типа и использовать его везде, где требуется объект базового типа. Но с другой стороны, поскольку решение о выбере реализации принимается во время выполнения, то это несколько замедляет общий ход работы программы.
