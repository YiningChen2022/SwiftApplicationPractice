//
//  main.swift
//  Swift Practice
//
//  Created by Yining Chen on 10/1/21.
//

import Foundation

print("Hello, World!")


//Exercise: Swift Variables
//1-  Declare a constant with a value of 25 and any name of your choice.
let res=25
//2-  Declare a variable explicitly with a value of 16.
var value: Double=16
//3-  Declare a variable implicitly with a value of 5.2
var value2=5.2
//4-  Print the sum of the values declared in 2) and 3) to the console (Use type casting where necessary).
print(value+value2)
//5-  Declare a variable of type String with Value “Swift”. Concatenate the string “Practice” with the first string.
var s: String="Swift"
var s1: String=" Practice"
print(s+s1)
//6-  Declare a variable with the value “iPhone”, and the variable name is an emoji (any emoji of your choice: command + control + space to access emojis).
var s3: String="iPhone"
var s4="🤣"
var str = s3+s4
print(str)
//7-  Declare another emoji variable with the value “iPhone\u{301}”

let s5 : String = "iPhone\u{301}"
print(s5)
//8-  Declare a variable that stores the value you get after applying the == operator on the emojis declared in 6) and 7).
var boo = str==s5
print(boo)

//Exercise: Swift Arrays
//1-  Declare an empty Array of type Int.
var emptyArray = [Int]()
//2-  Declare an empty Array of type String and initialize it with 3 values.
var emptyStringArr = ["String1","String2","String3"]
print(emptyStringArr)
//3-  Append the array [“String 4” , ”String 5”] to the array declared in 2).
emptyStringArr.append(contentsOf: ["String4","String5"])
print(emptyStringArr)
//4-  Insert the string “Random” at the 2nd index without overwriting the already existing value (Rearrange the indices).
emptyStringArr.insert("Random", at: 2)
print(emptyStringArr)
//5-  Declare an array and initialize it with the values [12 , “PewDiePie” , true , 176.325 , “J”].
var arr1 = [Any]()
arr1.append(contentsOf: [12, "PewDiePie",true, 176.325,"J" ])
print(arr1)
//6-  Use remove(at:) to remove any value from the array declared at 5).
arr1.removeAll()
print(arr1)


//Exercise: Swift Loops
//1-  Declare an empty Array of Integers.
var arr2=[Int]()
//2-  Initialize the array with prime numbers between 1 and 100.
arr2.append(2)
//only check the odd number
for num in stride(from: 3, through: 100, by: 2) {
    for p in arr2 {
        if p * p > num {
         
            arr2.append(num)
            break
        }
        if num % p == 0 {
            break
        }
    }
}
print(arr2)
//3-  Using the for-in loop print out all the numbers along with the sum of their digits.
for p in arr2{
    let sum = p/10+p%10
    print("\(p) \(sum)")
}
//4-  Using a repeat while loop add 2 to each number.

var i = 0
while i < arr2.count {
     arr2[i]=arr2[i]*arr2[i]
     i+=1
    //code
}
print(arr2)
//5-  Declare a string and cast it to an Array of characters. Iterate over this array to print out the characters along with their indices.
let string : String = "Hello"
let characters = Array(string)
var count=0
for char in characters{
    print ("\(char) \(count)")
    count+=1
}


//Exercise: Conditions
//1-  A school has following rules for grading system: a. Below 45 - F b. 45 to 60 – C c. 60 to 80 - B d. Above 80 - A Write a code block that lets you enter a certain score and displays the corresponding grade in the console.

let score = 88
switch score {
case 0..<45:
    print("F")
case 45..<60 :
    print("C")
case 60..<80 :
    print("B")
default:
    print("A")
}
//2-  Write a code block to enter the length and breadth of a rectangle. Based on your inputs print “Rectangle” is the values are different or “Square” is they are the same.
