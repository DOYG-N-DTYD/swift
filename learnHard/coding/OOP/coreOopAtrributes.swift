//
//  coreOopAtrributes.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 25/01/2025.
//

//Свойства бывают
//Хранимые Stored
//Вычесляемые Computed

//Ленивые хранимые свойства
//применяются только к переменным var
//приписывается им значение только при обращении к ним
class User {
     
    lazy var age: Int = 22
    lazy var name: String = "Tom"
}

//Вычисляемые свойства
//GET & SET
var имя_свойства: тип {
    get {
        //вычисление значения
    }
    set (параметр) {
        // установка значения
    }
}


////###################################################################################################
////Getter & Setter
////getter -> print(myAcc.profit)
////setter -> myAcc.profit = 1210 //1210 устанавливается как newProfit
//class Account{
//
//    var capital: Double = 0 // сумма вклада
//    var rate: Double = 0.01 // процентная ставки
//
//    var profit: Double{
//
//        get{
//            return capital + capital * rate
//        }
//        set(newProfit){
//
//            self.capital = newProfit / (1 + rate)
//        }
//    }
//
//    init(capital: Double, rate: Double){
//
//        self.capital = capital
//        self.rate = rate
//    }
//}
//
//var myAcc: Account = Account (capital: 1000, rate: 0.1)
//print (myAcc.profit)    // 1100
//
//// ожидаемая прибыль
//myAcc.profit = 1210
//print(myAcc.capital)    // 1100 - необходимая сумма вклада для получения этой прибыли

//###################################################################################################
//Только setter
//class Account{
//
//    var capital: Double = 0 // сумма вклада
//    var rate: Double = 0.01 // процентная ставки
//    //если не нужен setter то используем только getter
//    var profit: Double{
//
//        return capital + capital * rate
//    }
//
//    init(capital: Double, rate: Double){
//
//        self.capital = capital
//        self.rate = rate
//    }
//}
//
//var myAcc: Account = Account (capital: 1000, rate: 0.1)
//print (myAcc.profit)    // 1100


//###################################################################################################
//Наблюдатели свойств (property observers) следят за изменением значений свойств и при необходимости могут реагировать на эти изменения. Обозреватели свойств вызываются каждый раз при установке нового значения свойства, даже если новое значение не отличается от старого.

// willSet: вызывается перед установкой нового значения
// didSet: вызывается после установки нового значения

//var свойство: тип {
//    willSet (параметр){
//        // выражения
//    }
//    didSet (параметр){
//        // выражения
//    }
//}
//Применим наблюдатели свойств:

class Account{
 
    var capital: Double {
        willSet (newCapital){
             
            print("Старая сумма вклада: \(self.capital)  Новая сумма: \(newCapital)")
        }
        didSet (oldCapital){
            print("Сумма вклада увеличена на \(self.capital - oldCapital)")
        }
    }
    var rate: Double
     
    init(capital: Double, rate: Double){
     
        self.capital = capital
        self.rate = rate
    }
}
 
var myAcc: Account = Account(capital: 1000, rate: 0.1)
myAcc.capital = 1200
// вывод консоли
// "Старая сумма вклада: 1000  Новая сумма: 1200"
// "Сумма вклада увеличена на 200"

