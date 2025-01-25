//
//  coreFunctions.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 24/01/2025.
//

func имя_функции (параметры) -> тип_возвращаемого_значения {
    // набор инструкций
}

// без названий параметров
func имя_функции (_ : String, _ : Int) -> тип_возвращаемого_значения {
    // набор инструкций
}

// значения по умолчанию
func имя_функции (name : String = "User", age : Int = 18) -> тип_возвращаемого_значения {
    // набор инструкций
}

//###################################################################################################
//ВОЗВРАЩЕНИЕ ЗНАЧЕНИЙ ИЗ ФУНКЦИЙ

//Возвращает умножение
var x,y : Int
x = 10
y = 5
func square(_ x:Int, _ y:Int) -> Int{x*y}

//Возвращение нескольких значений в виде кортежа
var x1,y1 : Int
x1 = 10
y1 = 5
func sumAndSub(_ x:Int, _ y:Int) -> (sum:Int, sub:Int){
    
    let sum = x + y;
    let sub = x - y;
    
    return(sum,sub)
}

var sumSub = sumAndSub(x1, y1)
print (sumSub.sum)
print (sumSub.sub)

//Возвращение опционального значения
func optVal(_ val:Int) ->Int?{
    if (val > 20) {
       return val * 1000
    }
    return nil
}
print(optVal(30)!) // ! чтоб достать значение
print(optVal(5) ?? "val < 20 so func will return nil") // Нужно обслужить NIL


//###################################################################################################
//Передача в функцию большого количества не именованных значений
func manyVal(_ vals:Int...) ->Int{
    var counter:Int = 0
    for i:Int in vals {
        counter += i
    }
    return counter
}
print("!!!")
print(manyVal(1,2,3,4,5))

//Именнованные значения
func manyVal(vals:Int...) ->Int{
    var counter:Int = 0
    for i:Int in vals {
        counter += i
    }
    return counter
}
print("!!!")
print(manyVal(vals:1,2,3,4,5))


//Выходные параметры INOUT
func swap(a: inout Int, b: inout Int){
     
    let temp = a
    a = b
    b = temp
}
 
var num1 = 10
var num2 = 13
 
swap(&num1, &num2)
 
print(num1) // 13
print(num2) //  10

//###################################################################################################
//ТИПЫ ФУНКЦИИ ФУНКЦИИ КАК ПАРМЕТРЫ
//Функция как параметр. Присвоение функции переменной.

func sum (_ x: Int, _ y: Int) -> Int{
    
    var sumVal: Int;
    sumVal = x + y;
    return sumVal
}
func substract (_ x: Int, _ y: Int) -> Int{
    
    var substractVal: Int;
    substractVal = x - y;
    return substractVal
}

var funcParam : (Int,Int) -> Int
funcParam = sum
print("funcParam = sum , then out is -> ")
print(funcParam(10,5))

funcParam = substract
print("funcParam = substruct , then out is -> ")
print(funcParam(10,5))


//###################################################################################################
//ТИПЫ ФУНКЦИИ ФУНКЦИИ КАК ПАРМЕТРЫ
//Функция как параметр. Присвоение функции переменной.

func sum (_ x: Int, _ y: Int) -> Int{ return x + y}
func substract (_ x: Int, _ y: Int) -> Int{ return x - y}
func pov2 (_ x: Int, _ y: Int) -> Int{ return x * y}

func selectAction (_ n:Int) -> (Int,Int) -> Int {
    switch n {
    case 2:
        return substract
    case 3:
        return pov2
    default:
        return sum
    }
}


let x = 12, y = 8
 
var select = selectAction(1)    // add
print(select(x, y))       // 20
 
select = selectAction(2)        // subtract
print(select(x, y))       // 4
 
select = selectAction(3)        // multiply
print(select(x, y))       // 96



//Вложенные функции, находятся внутри функции и существуют локально внутри
func compare(_ r1: Double, _ r2: Double){
     
    func square(_ r: Double) -> Double{ return r * r * 3.14}
     
    let s1 = square(r1)
    let s2 = square(r2)
     
    print("разница площадей:", (s1 - s2))
}
 
compare(16.0, 15.0)

//###################################################################################################
//Рекурсивные функции
func factorial(_ n: Int) -> Int{
     
    if n == 0{
         
        return 1
    }
     
    return n * factorial(n-1)
}
 
var x = factorial(6)    // 720

//###################################################################################################
//Перегрузка функции
func sum(_ x: Int, _ y : Int){
    print(x+y)
}
func sum(_ x: Double, _ y: Double){
    print(x+y)
}
 
func sum(_ x: Int, _ y: Int, _ z: Int ){
    print(x + y + z)
}
 
sum(1, 2)           // 3
sum(1.2, 2.3)       // 3.5
sum(2, 3, 4)        // 9
