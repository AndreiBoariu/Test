import UIKit
import XCTest

class Problem1 {
    /// Given an integer array of size N, compute the sum of all even numbers in this array
    func sumEvenIntegersFromArray(arrObjects: [Any]) -> String {
        var sum = 0

        if arrObjects.isEmpty {
            return "Array is empty"
        }

        for obj in arrObjects {
            if let iObj = obj as? Int, iObj % 2 == 0 {
                sum += iObj
            }
        }

        return "Sum of all even numbers = \(sum)"
    }
}

class Problem2 {
    /// Given an integer array of size N, identify the largest 2 numbers in this array. Do not sort the array.

    func findTwoLargestNumbersInArray(arrNumbers: [Int]) -> String {
        // Ensure the array contains at least 2 numbers
        if arrNumbers.count < 2 {
            return "Array should contain at least 2 numbers"
        }

        var max1 = Int.min
        var max2 = Int.min

        for num in arrNumbers {
            if num > max1 {
                max2 = max1  // max1 becomes the second largest
                max1 = num   // update the largest
            } else if num > max2 {
                max2 = num   // update the second largest
            }
        }

        return "MAX1 = \(max1) and MAX2 = \(max2)"
    }
}

class Problem3 {
    /// Given an array of numbers having size N in which every number is between 1 and N,
    /// determine if there are any duplicates in it.
    func hasDuplicates(arrNumbers: inout [Int]) -> Bool {
        let n = arrNumbers.count
        for i in 0..<n {
            // Ensure the value is within the 1 to N range
            if arrNumbers[i] < 1 || arrNumbers[i] > n {
                return false  // Invalid array values outside the allowed range
            }

            let index = abs(arrNumbers[i]) - 1
            if arrNumbers[index] < 0 {
                return true  // Found a duplicate
            }
            arrNumbers[index] = -arrNumbers[index]  // Mark the element as visited
        }
        return false
    }
}

class MyTestCase: XCTestCase {

    func testProblem1() {
        let p1 = Problem1()
        let result = p1.sumEvenIntegersFromArray(arrObjects: ["a", 2.00, 3, 4, 5, 6.3, 7, 8, 9])

        XCTAssertEqual(result, "Sum of all even numbers = 14", "The sum of even integers should be 14.")
    }

    func testProblem2() {
        let p2 = Problem2()
        let result = p2.findTwoLargestNumbersInArray(arrNumbers: [10, 20, 3, 50, 11, 380])

        XCTAssertEqual(result, "MAX1 = 380 and MAX2 = 50", "The two largest numbers should be 380 and 50.")
    }

    func testProblem3() {
        let p3 = Problem3()

        // Declare a mutable array for duplicates check
        var arrWithDuplicates = [10, 20, 3, 50, 10, 380]
        let hasDuplicates = p3.hasDuplicates(arrNumbers: &arrWithDuplicates)

        XCTAssertTrue(hasDuplicates, "There should be duplicates in the array.")

        // Declare another mutable array for no duplicates check
        var arrWithoutDuplicates = [10, 20, 3, 50, 11, 380]
        let noDuplicates = p3.hasDuplicates(arrNumbers: &arrWithoutDuplicates)

        XCTAssertFalse(noDuplicates, "There should be no duplicates in the array.")
    }
}

MyTestCase.defaultTestSuite.run()


