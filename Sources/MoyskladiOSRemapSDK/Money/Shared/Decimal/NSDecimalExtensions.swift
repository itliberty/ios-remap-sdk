//
//  NSDecimalExtensions.swift
//  Money
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Daniel Thorpe
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


import Foundation

/**
 # NSDecimal Extension

 This is an extension on NSDecimal to support `DecimalNumberType` and
 `Decimal`.
 */
internal extension Decimal {

    /**
     Static function to get the `NSDecimal` representation of 
     zero.
     
     - returns: a `NSDecimal` of zero.
    */
    static var zero: Decimal {
        return NSDecimalNumber.zero.decimalValue
    }

    /**
     Static function to get the `NSDecimal` representation of
     positive one.

     - returns: a `NSDecimal` of one.
     */
    static var one: Decimal {
        return NSDecimalNumber.one.decimalValue
    }

    /**
     Boolean flag to indicate if the receive is a negative
     number.
     
     - returns: a `Bool` if the value is below zero.
    */
    var isNegative: Bool {
        return self < Decimal.zero
    }

    init() {
        self = Decimal.zero
    }

    /**
     Subtract a `NSDecimal` from the receiver.

     - parameter other: another `NSDecimal`.
     - parameter roundingMode: the NSRoundingMode to use for the calculation.
     - returns: a `NSDecimal`.
     */
    func subtract(other: Decimal, withRoundingMode roundingMode: NSDecimalNumber.RoundingMode) -> Decimal {
        var (lhs, rhs) = (self, other)
        var result = Decimal()
        NSDecimalSubtract(&result, &lhs, &rhs, roundingMode)
        return result
    }

    /**
     Add a `NSDecimal` to the receiver.

     - parameter other: another `NSDecimal`.
     - parameter roundingMode: the NSRoundingMode to use for the calculation.
     - returns: a `NSDecimal`.
     */
    
    func add(other: Decimal, withRoundingMode roundingMode: NSDecimalNumber.RoundingMode) -> Decimal {
        var (lhs, rhs) = (self, other)
        var result = Decimal()
        NSDecimalAdd(&result, &lhs, &rhs, roundingMode)
        return result
    }

    /**
     Multiply a `NSDecimal` with the receiver.

     - parameter other: another `NSDecimal`.
     - parameter roundingMode: the NSRoundingMode to use for the calculation.
     - returns: a `NSDecimal`.
     */
    
    func multiply(by: Decimal, withRoundingMode roundingMode: NSDecimalNumber.RoundingMode) -> Decimal {
        var (lhs, rhs) = (self, by)
        var result = Decimal()
        NSDecimalMultiply(&result, &lhs, &rhs, roundingMode)
        return result
    }

    /**
     Divide the receiver by a matching `NSDecimal`.

     - parameter other: another `NSDecimal`.
     - parameter roundingMode: the NSRoundingMode to use for the calculation.
     - returns: a `NSDecimal`.
     */
    
    func divide(by: Decimal, withRoundingMode roundingMode: NSDecimalNumber.RoundingMode) -> Decimal {
        var (lhs, rhs) = (self, by)
        var result = Decimal()
        NSDecimalDivide(&result, &lhs, &rhs, roundingMode)
        return result
    }

    /**
     Calculates the negative of the receiver.

     - parameter roundingMode: the NSRoundingMode to use for the calculation.
     - returns: a `NSDecimal`.
     */
    func negate(withRoundingMode roundingMode: NSDecimalNumber.RoundingMode) -> Decimal {
        let negativeOne = Decimal.zero.subtract(other: Decimal.one, withRoundingMode: roundingMode)
        let result = multiply(by: negativeOne, withRoundingMode: roundingMode)
        return result
    }

    /**
     The remainder of dividing another `NSDecimal` into the receiver.

     - parameter other: another `NSDecimal`.
     - parameter roundingMode: the NSRoundingMode to use for the calculation.
     - returns: a `NSDecimal`.
     */
    func remainder(other: Decimal, withRoundingMode roundingMode: NSDecimalNumber.RoundingMode) -> Decimal {
        let lhs = NSDecimalNumber(decimal: self)
        let rhs = NSDecimalNumber(decimal: other)
        let behaviors = NSDecimalNumberHandler(roundingMode: roundingMode, scale: 38, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        let result = lhs.remainder(other: rhs, withBehaviors: behaviors)
        return result.decimalValue
    }
}
