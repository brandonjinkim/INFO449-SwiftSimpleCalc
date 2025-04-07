//: # Welcome to the UW Calculator Playground (Simple Version)
//:
print("Welcome to the UW Calculator Playground")
import Foundation
//: This homework is designed to force you to exercise your knowledge of the Swift programming language. This homework does not involve iOS in any way. It uses the Playground feature of XCode to allow you to interactively write Swift code--the compiler will constantly check your code in the background.
//:
//: In this exercise, you will implement a pair of functions that do some simple mathematical calculations.
//:
//: ## Your tasks
//: You are to implement two `calculate` functions, each of which take `Strings` that must be converted to integer values in order to perform the calculations intended. This is designed to make you comfortable with converting Strings to other values--a common task in mobile applications, when obtaining input from the user--for further processing. One of the functions takes an array of Strings, expecting each "part" of the calculation expression to be each be in its own String (such as "2" "+" "2"), and the second expects a single String containing the entire expression ("2 + 2").
//: 
//: You should make sure your calculate method can handle the following kinds of input:
//: 
//: * `calculate(["2", "+", "2"])`: This should return 2+2, or 4
//: * `calculate(["2", "-", "2"])`: This should return 2-2, or 0
//: * `calculate(["2", "*", "2"])`: This should return 2*2, or 4
//: * `calculate(["2", "/", "2"])`: This should return 2/2, or 1
//: * `calculate(["2", "%", "2"])`: This should return 2%2, or 0
//: 
//: > For those who aren't aware of it, the "%" operator is called the "modulo" operator, and it is the "remainder" result in an integer division that does not divide equally. Thus, `5 % 2` is 1 (5 divided by 2 is 2 remainder 1), `10 % 3` is 1 (10 divided by 3 is 3 remainder 1) and `4 % 2` is 0 (4 divided by 2 is 2 remainder 0).
//: 
//: The `calculate` method also needs to support a few other less-traditional expressions as well:
//: 
//: * `calculate(["1", "2", "3", "4", "5", "count"])`: This should return a count of all the number arguments, which in this case will be 5.
//: * `calculate(["1", "3", "2", "avg"])`: This should return the average of the numbers, which is all of the values added up (1 + 3 + 2) and divided by the number of arguments (3).
//: * `calculate(["5", "fact"])`: This should calculate the factorial of the single number passed in, which is that number multiplied by each number below it. 5-factorial is 5 * 4 * 3 * 2 * 1, or 120.
//: 
//: For this latter set of operations, it is safe to assume that `["count"]` (with no additional arguments) is 0, `["avg"]` is also 0, and `["fact"]` is 0. `["1", "fact"]` should return 1, and `["0", "fact"]` should also return 1. (Yes, 0-factorial is 1. True story.)
//: 
func calculate(_ args: [String]) -> Int {
    
    if (args.count == 1) {
        return 0
    }
    
    else if(args[1] == "+") {
        let intA = Int(args[0])! //"!" is force unwrap for when a String is certain to convert to an int
        let intB = Int(args[2])!
        return intA + intB
    }
    
    else if(args[1] == "-") {
        let intA = Int(args[0])!
        let intB = Int(args[2])!
        return intA - intB
    }
    
    else if(args[1] == "*") {
        let intA = Int(args[0])!
        let intB = Int(args[2])!
        return intA * intB
    }
    
    else if(args[1] == "/") {
        let intA = Int(args[0])!
        let intB = Int(args[2])!
        return intA / intB
    }
    
    else if(args[1] == "%") {
        let intA = Int(args[0])!
        let intB = Int(args[2])!
        return intA % intB
    }
    
    else if (args.last == "count") {
        return args.count - 1
    }
    
    else if (args.last == "avg") {
        var total = 0
        var index = 0
        while (index < args.count - 1) {
            var num = Int(args[index])!
            total = total + num
            index += 1
        }
        return total / index
    }
    
    else if (args.last == "fact") {
        if (args.first == "0" || args.first == "1") {
            return 1;
        }
        else {
            var intFact = Int(args[0])!
            var Count = Int(args[0])!
            while (Count > 1) {
                intFact = intFact * (Count - 1)
                Count -= 1
            }
            return intFact
        }
    }
    return -1
}

func calculate(_ arg: String) -> Int {
    
    let stringArray = arg.components(separatedBy: " ")

    if (stringArray.last == "count") {
        return stringArray.count - 1
    }
    
    else if (stringArray.last == "avg") {
        var total = 0
        var index = 0
        while (index < stringArray.count - 1) {
            var num = Int(stringArray[index])!
            total = total + num
            index += 1
        }
        return total / index
    }
    
    else if (stringArray.last == "fact") {
        var intFact = Int(stringArray[0])!
        var Count = Int(stringArray[0])!
        while (Count > 1) {
            intFact = intFact * (Count - 1)
            Count -= 1
        }
        return intFact
    }
    
    if (stringArray.count == 1) {
        return 0
    }
    
    else if(stringArray[1] == "+") {
        let intA = Int(stringArray[0])! //"!" is force unwrap for when a String is certain to convert to an int
        let intB = Int(stringArray[2])!
        return intA + intB
    }
    
    else if(stringArray[1] == "-") {
        let intA = Int(stringArray[0])!
        let intB = Int(stringArray[2])!
        return intA - intB
    }
    
    else if(stringArray[1] == "*") {
        let intA = Int(stringArray[0])!
        let intB = Int(stringArray[2])!
        return intA * intB
    }
    
    else if(stringArray[1] == "/") {
        let intA = Int(stringArray[0])!
        let intB = Int(stringArray[2])!
        return intA / intB
    }
    
    else if(stringArray[1] == "%") {
        let intA = Int(stringArray[0])!
        let intB = Int(stringArray[2])!
        return intA % intB
    }
    
    return -1
}

//: Below this are the test expressions/calls to verify if your code is correct.
//:
//: ***DO NOT MODIFY ANYTHING BELOW THIS***
//: -------------------------------------------
//: All of these expressions should return true
//: if you have implemented `calculate()` correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

//: -------------------------------------------
//: These are extra credit tests; they are commented out 
//: so that they do not conflict with you work until you 
//: choose to implement them.
//: Uncomment them to turn them on for evaluation.
//:
//: Implement `calculate([String])` and `calculate(String)` to handle negative numbers. You need only make the tests below pass. (You do not need to worry about "fact"/factorial with negative numbers, for example.)
//:
//: This is worth 1 pt
/*
calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5
*/
 
//: Implement `calculate([String])` and `calculate(String)` to use 
//: and return floating-point values. You need only make the tests 
//: below pass. (Factorial of floating-point numbers doesn't make 
//: much sense, either.)
//:
//: Swift *will* allow you to overload based on return types, so 
//: the below functions can co-exist simultaneously with the 
//: Integer-based versions above.
//: 
//: This is worth 1 pt
/*
func calculate(_ args: [String]) -> Double {
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5.0
*/
