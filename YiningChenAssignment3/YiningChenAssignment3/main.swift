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
         result = getBMI(weight: weight, height: height)*1.2/0.23*Double (Age)-16.2
    }else{
        result = getBMI(weight: weight, height: height)*1.2/0.23*Double (Age)-5.4

    }
      return result
}

print(getBodyFatPercentage(weight: 50,height: 165,Age: 16, Gender: "Women"))
