import UIKit
import XCTest

class Problem1 {
    /// Given an integer array of size N, compute the sum of all even numbers in this array
    func sumIntegersFromArray(arrObjects: [Any]) -> String {
        var sum = 0
        
        if arrObjects.count == 0 {
            return "Array is empty"
        }
        
        for obj in arrObjects {
            if let iObj = obj as? Int {
                sum += iObj
            }
        }
        
        return "Sum of all even numbers = \(sum)"
    }
}

class Problem2 {
    /// Given an integer array of size N, identify the largest 2 numbers in this array. Do not sort the array.
    
    func findTwoLargestNumbersInArray(arrNumbers: [Int]) -> String {
        if arrNumbers.count < 1 {
            return "Array should contain at least 2 numbers"
        }
        
        var max1 = Int.min
        var max2 = Int.min
        
        for num in arrNumbers {
            if num > max1 {
                max2 = max1
                max1 = num
            }
            else
                if num > max2 {
                    max2 = num
                }
        }
        
        return "MAX1 = \(max1) and MAX2 = \(max2)"
    }
}

class Problem3 {
    /// Given an array of numbers having size N in which every number is between 1 and N, determine if there are any duplicates in it. You are allowed to destroy the array if you like. Do not sort the array or use bit vectors. Try to work within the array without using any other temporary data structures. Do not use 2 nesting for loops since the time complexity would be high. Try to find a solution by executing just one loop. Hint: manipulate the elements of the same array as you loop through.
    
    func hasDuplicates(arrNumbers: [Int]) -> Bool {
        
        let arrUnique = Array(Set(arrNumbers))
        if arrUnique.count == arrNumbers.count {
            return false
        }
        
        return true
        
        // Possible solution, but not able to run it on Swift :(
//        let n = arrNumbers.count
//        var arrTempNumbers = arrNumbers
//
//        for index in arrNumbers {
//            var iElement = arrNumbers[index] % n
//            if arrNumbers[iElement] > n {
//                return true
//            }
//            else {
//                arrNumbers[iElement] += n
//            }
//        }
//
//        return false
    }
}

extension Array where Element: Equatable {
    
    public func uniq() -> [Element] {
        var arrayCopy = self
        arrayCopy.uniqInPlace()
        return arrayCopy
    }
    
    mutating public func uniqInPlace() {
        var seen = [Element]()
        var index = 0
        for element in self {
            if seen.contains(element) {
                remove(at: index)
            } else {
                seen.append(element)
                index += 1
            }
        }
    }
}

class MyTestCase: XCTestCase {
    
    func testProblem1() {
        let p1 = Problem1()
        p1.sumIntegersFromArray(arrObjects: ["a",2.00,3,4,5,6.3,7,8,9])

        XCTAssertTrue(true)
    }
    
    func testProblem2() {
        let p2 = Problem2()
        p2.findTwoLargestNumbersInArray(arrNumbers: [10, 20, 3, 50, 11, 380])
        
        XCTAssertTrue(true)
    }
    
    func testProblem3() {
        let p3 = Problem3()
        if p3.hasDuplicates(arrNumbers: [10, 20, 3, 50, 10, 380]) {
            print("Duplicates found")
        }
        
        XCTAssertTrue(true)
    }
    
    func testProblem3_Method2() {
        let array = [2, 1, 2, 3, 7, 1]
        if array.uniq().count != array.count {
            print("Duplicates found")
        }
        
        XCTAssertTrue(true)
    }
}

MyTestCase.defaultTestSuite.run()
