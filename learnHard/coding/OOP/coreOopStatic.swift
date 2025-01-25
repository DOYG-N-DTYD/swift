//
//  coreOopStatic.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 25/01/2025.
//

//Static attributes
//Static methods
//статические методы и свойсвта принадлежат целому классу а не экземпляру

class Account{
 
    var capital: Double
    var rate: Double
     
    static let usdRate: Double = 69
     
    init(capital: Double, rate: Double){
     
        self.capital = capital
        self.rate = rate
    }
     
    func convert() -> Double{
         
        return capital / Account.usdRate //обращение к классу для получения значения статической переменной
    }
}


//Статический метод
class Exchange{
    static let rate = 58.9      // текущий курс доллара
    static func operate(sum: Double) -> Double{     // обмен нац. валюты на доллары
        return sum / rate
    }
}
 
print(Exchange.operate(sum: 20000))
//Exchange.rate = 58.5        //  изменяем обменный курс LET не получится
print(Exchange.operate(sum: 15000))
print(Exchange.operate(sum: 56000))
