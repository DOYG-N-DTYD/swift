//
//  coreOopInheritance.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 27/01/2025.
//

//НАСЛЕДОВАНИЕ
//super
//override свойств
//override методы


//Переопределение инициализаторов
//При переопределении инициализатора необходимо вызвать инициализатор базового класса для инициализации тех свойств, которые определены в базовом классе. Кроме того, если в подклассе есть собственные свойства, их необходимо инициализировать до вызова инициализатора базового класса:
class User{
 
    var name: String
    var surname: String
     
    init(name: String, surname: String){
         
        self.name = name
        self.surname = surname
    }
     
    var fullInfo: String{
         
        return "\(self.name) \(self.surname)"
    }
}
 
class Employee : User{
     
    var company: String
    override init(name: String, surname: String){
         
        self.company = "Unknown"
        super.init(name: "Mr." + name, surname: surname)
    }
     
    init(name: String, surname: String, company: String){
         
        self.company = company
        super.init(name: name, surname: surname)
    }
     
    override var fullInfo: String{
         
        return super.fullInfo + " - \(self.company)"
    }
}
 
var emp: Employee = Employee(name: "Tim", surname: "Cook")
print(emp.fullInfo)   // Mr. Tim Cook - Unknown


// required инициализаторы
class User{
 
    var name: String
    var surname: String
     
    required init(name: String, surname: String){
         
        self.name = name
        self.surname = surname
    }
}
 
class Employee : User{
     
    var company: String
    required init(name: String, surname: String){
         
        self.company = "Unknown"
        super.init(name: "Mr." + name, surname: surname)
    }
     
    init(name: String, surname: String, company: String){
         
        self.company = company
        super.init(name: name, surname: surname)
    }
}


//запрет переопределения final
//запрет наследования класса
//С помощью ключевого слова final мы можем запретить переопределение свойств, методов, сабскриптов в производном классе:
class User{
 
    var name: String
    var surname: String
     
    init(name: String, surname: String){
         
        self.name = name
        self.surname = surname
    }
     
    final var fullInfo: String{
         
        return "\(self.name) \(self.surname)"
    }
}
Теперь свойство fullInfo нельзя будет переопределить в производном классе.

final class User{
     
    //.............
}


//class properties/class methods
class Exchange{
    class var usd : Double { return 59.0 }
    class func convert(sum: Double) -> Double{
        return sum / usd
    }
}
         
class BankExchange : Exchange{
             
    override static var usd : Double{ return 59.1 }
    override static func convert(sum: Double) -> Double{
        return sum / usd - sum / usd * 0.1
    }
}
         
print(Exchange.convert(sum: 20000))         // 338.98
print(BankExchange.convert(sum: 20000))     // 304.56
//К таким свойствам и методам обращение идет по имени класса, как и в случае со статическими.
//При переопределении свойств класса следует учитывать, что свойства класса должны быть вычисляемыми, как в данном случае.
//Также стоит учитывать, что при переопределении мы можем определить свойства и методы как статические, как в случае выше, тогда они также будут недоступны для переопрееления для классов-наследников от BankExchange. Либо же мы также можем определить их как свойства и методы класса:

class BankExchange : Exchange{
     
    override class var usd : Double{ return 59.1 }
    override class func convert(sum: Double) -> Double{
        return sum / usd - sum / usd * 0.1
    }
}
