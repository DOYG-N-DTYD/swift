//
//  coreOopEnums.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 25/01/2025.
//

//Перечисления
enum Season{
 
    case Winter
    case Spring
    case Summer
    case Autumn
}
//Сокращенная форма
enum Season{
 
    case Winter, Spring, Summer, Autumn
}
//Обращение к перечислениям
//var currentSeason = Season.Spring
//Здесь переменная currentSeason представляет тип Season. Впоследствии мы можем присвоить этой переменной другое значение из Season:
//
//var currentSeason = .Summer
//Либо мы можем сначала определить переменную / константу типа перечисления, а потом ее инициализировать:
//
//let lastSeason: Season
//lastSeason = Season.Winter

//Достать значение из перечисления при помощи SWITCH
enum Season{
    case Winter, Spring, Summer, Autumn
}
let currentSeason = Season.Spring
switch(currentSeason){
case .Winter:
    print("Зима")
case .Spring:
    print("Весна")
case .Summer:
    print("Лето")
case .Autumn:
    print("Осень")
}

//###################################################################################################
//Ассоциированные значения
// The Swift Programming Language
import Foundation
print(" ### main.swift base file ### ")

// класс
// наследник
// перечисление
// получение инфы и установление значений через CASE/ENUM

class Instrument {
    
    let instrumentType: String
    let instrumentMaterial: String
    let instrumentProducer: String
    
    init(instrumentType: String, instrumentMaterial: String, instrumentProducer: String) {
        self.instrumentType = instrumentType
        self.instrumentMaterial = instrumentMaterial
        self.instrumentProducer = instrumentProducer
    }
    
    func printData (){
        print("Instrument type \(self.instrumentType) \n InstrumentMaterial \(self.instrumentMaterial) \n InstrumentProducer \(self.instrumentProducer)")
    }
}

class Guitar : Instrument {
    
    let guitarAmountStrings: Int8
    
    init( guitarAmountStrings: Int8, instrumentMaterial: String, instrumentProducer: String) {
        self.guitarAmountStrings = guitarAmountStrings
        super.init(instrumentType: "guitar",instrumentMaterial: instrumentMaterial, instrumentProducer: instrumentProducer)
    }
    
    override func printData() {
        print("InstrumentType: \(self.instrumentType) \n StringsAmount:\(self.guitarAmountStrings) \n CompanyProducer: \(self.instrumentProducer) \n Material \(self.instrumentMaterial) \n ")
    }
}

var drum: Instrument = Instrument(instrumentType: "drum", instrumentMaterial: "metal", instrumentProducer: "tama")
var guitar: Guitar = Guitar(guitarAmountStrings: 6,instrumentMaterial: "Mahagony",instrumentProducer: "Gibson")

//drum.printData()
//guitar.printData()


//###################################################################################################
// Ассоциированные значения в перечеслениях
//С каждым значением в перечислении мы можем ассоциировать какое-либо другое значения, которое может представлять любой тип. При этом ассоциированные значения для
//разных значений одного и того же перечисления могут представлять различные типы.

enum instruments {
    case Drum(String)
    case Guitar(String, Int)
}

var instrument = instruments.Guitar("Gibson", 6)
instrument = instruments.Drum("Tama")

switch(instrument){
case .Guitar:
    print("You have guitar")
case .Drum:
    print("Drum you have")
}

//можно получать значения
switch(instrument){
    case .Guitar (let company, let strings):
        print("Guitar: \(company), количество strings \(strings)")
    case .Drum (let company):
        print("Drums: \(company)")
}

//Чистые значения перечислений RAW VALUES
enum Flagman: String{
    case Samsung = "Galaxy S9"
    case Apple = "iPhone X"
    case Microsoft = "Lumia 950"
    case Google = "Pixel 2"
}
//При определении чистых значений нам надо указать их тип. В данном случае типом будет выступать тип String. Затем в программе мы сможем получить эти чистыe
//значения с помощью свойства rawValue:


var myPhone = Flagman.Apple
print(myPhone)  // Apple
print(myPhone.rawValue) // iPhone X
//Если мы укажем тип прямых значений, но не укажем эти самые значения, то swift использует значения по умолчанию.
//Если тип - String, то чистые значения будут представлять строковое представление элементов перечисления:

enum FlagmanPhone: String{
     
    case Samsung, Apple, Microsoft, Google
}
var myFlagmanPhone = FlagmanPhone.Apple
print(myFlagmanPhone)  // Apple
print(myFlagmanPhone.rawValue) // Apple



//Если типом для чистых значений является тип Int, то элементы перечисления получат значения по порядку:
enum DayOfWeek: Int{
     
    case Monday=1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}
 
var currentDay = DayOfWeek.Wednesday
print(currentDay)   // Wednesday
print(currentDay.rawValue)  // 3
//Первый элемент перечисления Monday=1 задает начальное значение для элементов перечисления. Если же мы не укажем его, то начальным значением будет 0.
//Используя чистое значение, мы можем получить элемент перечисления:

enum DayOfWeek1: Int{
     
    case Monday=1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}
 
var currentDay1 = DayOfWeek1(rawValue: 7) // Optional(DayOfWeek.Sunday)
print(currentDay1!)


//###################################################################################################
//Методы перечислений
enum DayOfWeek: Int{
     
    case Monday=1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
     
    func getCurrentDay() -> String{
         
        return DayOfWeek.getDay(number: rawValue)
    }
     
    static func getDay(number: Int) -> String{
         
        switch number{
             
            case 1:
                return "Понедельник"
            case 2:
                return "Вторник"
            case 3:
                return "Среда"
            case 4:
                return "Четверг"
            case 5:
                return "Пятница"
            case 6:
                return "Суббота"
            case 7:
                return "Воскресенье"
            default:
                return "undefined"
        }
    }
}
 
var someDay: DayOfWeek = DayOfWeek.Sunday
someDay.getCurrentDay() // Воскресенье
var secondDay = DayOfWeek.getDay(number: 2) // Вторник

//Свойства перечислений
enum DayOfWeek: Int{
     
    case Monday=1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
     
    var label : String {
        switch self {
            case .Monday: return "Понедельник"
            case .Tuesday: return "Вторник"
            case .Wednesday: return "Среда"
            case .Thursday: return "Четверг"
            case .Friday: return "Пятница"
            case .Saturday: return "Суббота"
            case .Sunday: return "Воскресенье"
        }
    }
}
let day1 = DayOfWeek.Monday
print(day1.label)               // Понедельник
print(DayOfWeek.Friday.label)   // Пятница

//Инициализаторы в перечислениях
enum DayOfWeek: Int{
     
    case Monday=1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
    init?(_ val:String) {
         
        switch val {
        case "Понедельник"  : self = .Monday
        case "Вторник": self = .Tuesday
        case "Среда": self = .Wednesday
        case "Четверг": self = .Thursday
        case "Пятница": self = .Friday
        case "Суббота": self = .Saturday
        case "Воскресенье": self = .Sunday
        case _ : return nil
        }
    }
}
let day1 = DayOfWeek("Пятница")
print(day1!.rawValue)               //  5
