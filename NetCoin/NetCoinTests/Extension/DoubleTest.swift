/*
  DoubleTest.swift
  NetCoinTests

  Created by Kwabena Ankamah on 08/12/2022.
  
*/
import XCTest
@testable import NetCoin
final class DoubleTest: XCTestCase {

    func testConvertDoubleToPercentage(){
        let num1 = -0.62
        let convertedNum1 = num1.toPercentString()
        print(convertedNum1)
        XCTAssertEqual(convertedNum1, "-0.62%")
    }
    func testPercentageRoundup(){
        let num2 = -0.626
        let convertedNum2 = num2.toPercentString()
        print(convertedNum2)
        XCTAssertEqual(convertedNum2, "-0.63%")
    }
    func testPercentageRoundDown(){
        let num3 = -0.621
        let convertedNum3 = num3.toPercentString()
        XCTAssertEqual(convertedNum3, "-0.62%")
    }
    func testConvertDoubleToString(){
        let num4 = 29.39
        let convertedNum4 = num4.toCurrency()
        XCTAssertEqual(convertedNum4, "$29.39")
    }
    func testRoundUpDoubleToString(){
        let num5 = 29.39789
        let convertedNum5 = num5.toCurrency()
        XCTAssertEqual(convertedNum5, "$29.40")
    }
    func testRoundDownDoubleToString(){
        let num6 = 29.332
        let convertedNum6 = num6.toCurrency()
        XCTAssertEqual(convertedNum6, "$29.33")
    }
   
}
