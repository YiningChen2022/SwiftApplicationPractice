//
//  main.swift
//  YiningChenAssignment3
//
//  Created by Yining Chen on 10/6/21.
//

import Foundation

print("Hello, World!")

//Exercise: Swift Functions
//Create a function called ‘getBMI’ which takes two parameters in the form of Int and returns the BMI.
//Formula for BMI is [weight/height/height] * 10,000  here Weight is in Kgs and height is in Cm. ( Feel free to use your own BMI formula if you have any.)
//Print the value that returns from this function on the console
func getBMI (weight: Int, height: Int)->Double{
    let wightd=Double (weight)
    let heightd=Double (height)
    let BMI=(wightd/heightd/heightd)*10000

    return BMI
}
print(getBMI(weight: 50,height: 165))
//Create a function called ‘getProteinIntake’ which takes one parameters i.e weight in the form of Int and returns the result
//Formula to calculate Protein intake is 0.36 grams per pound that you weigh
//example if weight is 150 pounds then protein  intake must be   150 * 0.36 = 54              grams .Print the value that returns from this function on the console
func getProteinIntake (weight: Int)->Double{
    let result = Double(weight)*0.36
    return result
}
print(getProteinIntake(weight:150))

//Create a function called ‘getBodyFatPercentage’  which will take four parameters  weight , height and Age in Int and Gender in String.            for Men Formula is 1.20 * BMI / 0.23 * Age -16.2           for Women Formula is 1.20 * BMI / 0.23 * Age -5.4           for calculating BMI please call “getBMI” function Print the value that returns from this function on the console
func getBodyFatPercentage (weight: Int, height: Int, Age: Int, Gender:String)->Double{
    var result=0.0
    if Gender == "Man"{
         result = getBMI(weight: weight, height: height)*1.2+0.23*Double (Age)-16.2
    }else{
        result = getBMI(weight: weight, height: height)*1.2+0.23*Double (Age)-5.4

    }
      return result
}
print(getBodyFatPercentage(weight: 50,height: 165,Age: 16, Gender: "Women"))


//Exercise: Swift Structures
// Create a structure ‘Health’ with four properties: Height(Double), Weight (Double), Gender(String) and Age (Int)
struct Health{
    var weight=0.0
    var height=0.0
    var gender=""
    var  Age=0
}
// Create 2 instances of the structure providing the height, weight , gender and age.
let someHealth = Health(weight:50.5,height:166.5,gender:"Woman",Age:20)
let otherHealth = Health(weight:100.2,height:188,gender:"Man",Age:50)



//Modify the function ‘getBMI’ to accept two Doubles perform the same operation
func getBMI (weight: Double, height: Double)->Double{
    let BMI=(weight/height/height)*10000
    return BMI
}
//Modify the function called ‘getBodyFatPercentage’  which will take four parameters  weight , height in Double, Age in Int and Gender in String.
func getBodyFatPercentage (weight: Double, height: Double, Age: Int, Gender:String)->Double{
    var result=0.0
    if Gender == "Man"{
         result = getBMI(weight: weight, height: height)*1.2+0.23*Double (Age)-16.2
    }else{
        result = getBMI(weight: weight, height: height)*1.2+0.23*Double (Age)-5.4

    }
      return result
}
//Pass the height, weight , gender and age from the 2 instances of ‘Health’ that you just created to the ‘getBodyFatPercentage’ function and print the output


print(getBodyFatPercentage(weight: someHealth.weight,height:someHealth.height,Age: someHealth.Age, Gender: someHealth.gender))
print(getBodyFatPercentage(weight: otherHealth.weight,height:otherHealth.height,Age: otherHealth.Age, Gender: otherHealth.gender))



//Exercise: Swift Classes
//Create a class ‘ClubMember’ with an empty function ‘memberType()’.
class ClubMember{
    func memberType(){}
}

//Create a class ‘Employee’ as a subclass of ‘ClubMember’ override the function ‘memberType()’ that prints ‘I am an Employee’.
class Employee: ClubMember{
    override func memberType(){
        print("I am an Employee")
    }
}
//Create a class ‘Customer’ as a subclass of ‘ClubMember’ override the function ‘memberType’ that prints ‘I am a Customer’.
class Customer: ClubMember{
    override func memberType(){
        print("I am an Customer")
    }
}
//Create an instance of class ‘Employee’ and class ‘Customer’.
let employee = Employee()
let customer = Customer()

//Print the memberType from each of these instances.
employee.memberType()
customer.memberType()
//Print if each of these instances is an instance of class ‘ClubMember’.
print(employee is ClubMember)
print(customer is ClubMember)


//Exercise: Swift Optionals
//Ask the user their name, take an input using command line.
//If no input was provided print ‘Welcome Anonymous User’
//If the input is all numbers print ‘Welcome Code Name ’ followed by the number
//Otherwise print ‘Welcome ’ followed by the String entered

let name: String? = readLine()
let num=Int(name!)

if name==nil{
    print("Welcome Anonymous User")
}else if num != nil{
    print("Welcome Code Name \(num!)")
}else{
    print("Welcome \(name!)")
}


//Exercise: Swift Extension
//Create a function called ‘calculate’ as an extension of Int data type.
//‘calculate’ should return the square of an integer and the sum of all numbers from 1 to that number (inclusive)
//Use number range
//Eg.Input: 5
//Output: square:25, sum:15
extension Int{
    mutating func square() {
          self = self * self
      }
    func sum(){
        var n=self
        var sum=0
        while n>0{
            print(n)
            sum+=n
            n-=1
        }
        self=sum
    }
}
var someint=5
someint.square()
print(someint)
var someint2=5
someint2.sum()
print(someint2)
