//
//  coreLoops.swift
//  FirstSwiftProject
//
//  Created by Miroslaw Zborowski on 24/01/2025.
//


//  FOR-IN
//  можно добавлять условие WHERE
var counter: Int = 10
for iter in 1...10{
    print(iter)
}
//  WHILE
var i:Int = 5
while(i > 0){
    print(i)
    i-=1;
}
//  REPEAT-WHILE
//  цикл хоть раз да может выполниться даже если условие не удовлетворяет
var ii:Int = -1
repeat{
    print(ii)
    ii-=1
}while(i > 0)


print("CONTINUE")
//  CONTINUE
// при удовлетворении условию просто переходит к следующей итерации
var iii:Int = 5
while(iii > 0){
    iii -= 1
    if iii == 3 {continue}
    print(iii)
}
print("BREAK")
//  BREAK
// при удовлетворении условию выходит из цикла
iii = 5
while(iii > 0){
    print(iii)
    iii -= 1
    if iii == 3 {break}
}

