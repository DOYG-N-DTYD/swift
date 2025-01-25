//
//  coreOopClassesObjects.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 25/01/2025.
//

//###################################################################################################
class Guitar {
    
    let material: String
    let company: String
    let stringsAmount: Int8
    
    // инициализатор без параметров
    init(){
        material = "mahagony"
        company = "gibson LP"
        stringsAmount = 6
    }
    // инициализатор с параметрами
    init(_ material:String, _ company:String, _ stringAmount:Int8){
        self.material = material
        self.company = company
        self.stringsAmount = stringAmount
    }
    
    func getGuitarInfo(){
        print("Material: \(self.material) \n Company: \(self.company) \n StringAmount: \(self.stringsAmount)")
    }
}

//Создание экземпляра класса
//Guitar() инициализатор
var glp:Guitar = Guitar()
glp.getGuitarInfo()

var fender:Guitar = Guitar("stone","fender",6)
fender.getGuitarInfo()


//###################################################################################################
//Делегирование инициализации
class User {
     
    var age: Int
    var name: String
     
    convenience init(){
         
        self.init(name: "Tom", age: 22)
    }
    init(name: String, age: Int){
         
        self.age = age
        self.name = name
    }
     
    func getUserInfo(){
     
        print("Имя: \(self.name); возраст: \(self.age)")
    }
}
 
var tom: User = User()
tom.getUserInfo()   // Имя: Tom; возраст: 22

//###################################################################################################
//Failable-инициализаторы
//возможность вернуть NIL при фэйле инициализации объекта
class UserFailable{
     
    var name: String
    var age: Int
    init?(name: String, age: Int){
         
        self.name = name
        self.age = age
        if(age < 0){
            return nil
        }
    }
}
// если объект не создается то не будет принта
if let bob: UserFailable = UserFailable(name: "Bob", age: -2){
    print(bob.name) // Bob
}

