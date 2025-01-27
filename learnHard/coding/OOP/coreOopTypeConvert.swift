//
//  coreOopTypeConvert.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 27/01/2025.
//

//При определении иерархии классов мы можем использовать объекты производного класса везде, где требуеются объекты базового класса. Например, следующие классы:
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
    func work(){
        print("\(self.name) работает")
    }
}
//Поскольку класс Employee наследуется от класса Person, то везде, где требуется объект Person, мы можем использовать объект Employee:

func getInfo(p: Person){
    p.display()
}
         
let tom: Employee = Employee(name:"Tom", age: 23, company: "Google")
let bob: Person = Employee(name: "Bob", age: 28, company: "Apple")
 
getInfo(p: tom)     // Имя: Tom  Возраст: 23  Сотрудник компании: Google
getInfo(p: bob)     // Имя: Bob  Возраст: 28  Сотрудник компании: Apple
//И в данном случае никаких ошибок не возникнет. И компилятор автоматически преобразует объекты Employee к типу Person.
//Но теперь рассмотрим другую ситуацию:

let bob: Person = Employee(name: "Bob", age: 28, company: "Apple")
print(bob.company)      // ! Ошибка: у типа Person нет свойства company
bob.work()              // ! Ошибка: у типа Person нет метода work
//В данном случае константа bob представляет тип Person, но хранит ссылку на объект Employee, у которого есть свойство company и метод work. Однако у типа Person их нет. И в данном случае константа bob воспринимается имеено объект Person, объект Person не обязательно должен представлять объект Employee.
//Или другой пример:

func getInfo(p: Employee){
    p.display()
}
         
let bob: Person = Employee(name: "Bob", age: 28, company: "Apple")
getInfo(p: bob)     // ! Ошибка: bob представляет объект Person, а не Employee
//Функция getInfo принимает объект Employee, однако константа bob представляет именно объект Person, несмотря на то, что хранит ссылку на объект Employee, поэтому автоматически мы ее передать в этот метод не можем.
//Нисходящее преобразование
//Что же делать, если переменная / константы представляет объект базового типа, однако нам необходимо его использовать как объект производного типа? В этом случае необходимо применить нисходящее преобразование типов (downcasting). Для этого применяется оператор as!:

func getInfo(p: Employee){
    p.display()
}
         
let bob: Person = Employee(name: "Bob", age: 28, company: "Apple")
         
print((bob as! Employee).company)       // Apple
         
(bob as! Employee).work()               // Bob работает
         
getInfo(p: (bob as! Employee))          // Имя: Bob  Возраст: 28  Сотрудник компании: Apple
 
let bobEmpl = bob as! Employee
bobEmpl.work()
//Безопасное преобразование
//Хотя оператор as! позволяет преобразовать объект одного типа в другой, тем не менее мы можем столкнуться с ошибкой:

let tom: Person = Person(name:"Tom", age: 23)
let tomEmpl: Employee = tom as! Employee
//Здесь константа tom хранит ссылку на объект Person, а не Employee. Поэтому при попытке преобразования к типу Employee мы получим ошибку. Чтобы избежать подобных ошибок, следует проверять тип перед преобразованием типов с помощью оператора is:

let tom: Person = Person(name:"Tom", age: 23)
if tom is Employee{
    let tomEmpl: Employee = tom as! Employee
    tomEmpl.work()
}
         
let bob: Person = Employee(name: "Bob", age: 28, company: "Apple")
if bob is Employee{
    let bobEmpl = bob as! Employee
    bobEmpl.work()
}
//В качестве альтернативы мы можем преобразовывать объект в тип Optional с помощью оператора as?, а затем проверять на nil:

let tom: Person = Person(name:"Tom", age: 23)
 
let tomEmpl: Employee? = tom as? Employee
if tomEmpl != nil{
    tomEmpl!.work()
}
         
let bob: Person = Employee(name: "Bob", age: 28, company: "Apple")
let bobEmpl = bob as? Employee
if bobEmpl != nil{
    bobEmpl!.work()
}
//Также можно сократить код следующим образом с помощью оператора ?.:

let tom: Person = Person(name:"Tom", age: 23)
(tom as? Employee)?.work()
         
let bob: Person = Employee(name: "Bob", age: 28, company: "Apple")
(bob as? Employee)?.work()
