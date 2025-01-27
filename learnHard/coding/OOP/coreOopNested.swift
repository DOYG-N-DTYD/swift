//
//  coreOopNested.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 27/01/2025.
//

//Типы могут быть вложенными (nested). Класс или структура может содержать определение другого класса или структуры. Например:

class User{
    var name: String
    var age: Int
    var profile: UserProfile
         
    struct UserProfile{
        var login: String
        var password: String
             
        func authenticate(_ login: String, _ password: String) -> Bool{
            return self.login == login && self.password == password
        }
    }
     
    init(name: String, age: Int, login: String, password: String){
        self.name = name
        self.age = age
        self.profile = UserProfile(login: login, password: password)
    }
}
     
var tom = User(name: "Tom", age: 23, login: "querty", password: "12345")
print(tom.profile.authenticate("sdf", "456"))           // false
print(tom.profile.authenticate("querty", "12345"))      // true
//Здесь структура UserProfile является вложенной. Вложенные типы также могут определять свойства, методы, инициализаторы. А внешний тип может хранить объект вложенного типа.
//Также вложенные типы могут использовать вне своего типа, в котором они определены. В этом случае к ним необходимо обращаться через имя внешнего типа:

var profile = User.UserProfile(login: "ssdf", password: "345")
var isLoged = profile.authenticate("ssdf", "345")               // true
