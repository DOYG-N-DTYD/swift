//
//  coreOopStruct.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 25/01/2025.
//

//отличие структуры от класса,что при создании структуры в инициализатор нужно передать все значения свойств структуры
//даже если внутри самой структуры нет всех инициализаторов
struct User {
    var name: String
    var age: Int
     
    init(name: String){
         
        self.init(name: name, age: 15)
    }
    init(name: String, age: Int){
         
        self.name = name
        self.age = age
    }
     
    func getInfo() -> String{
     
        return "Имя: \( name). Возраст: \(age)"
    }
}
var tom: User = User(name: "Tom")
print(tom.getInfo())    // Имя: Tom. Возраст: 15
 
var bob  = User(name: "Bob", age: 23)
print(bob.getInfo())


//###################################################################################################
//mutating-методы
//в структурах нельзя изменять свойства без mutating
struct User {
    var name: String
    var age: Int
     
    func getInfo() -> String{
     
        return "Имя: \( name). Возраст: \(age)"
    }
     
    mutating func setName(name: String){
        self.name = name
    }
}
 
var bob  = User(name: "Bob", age: 23)
bob.setName(name: "Robert")
print(bob.getInfo())
