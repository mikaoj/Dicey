// The MIT License (MIT)
//
// Copyright (c) 2017 Joakim Gyllström
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

public struct Dicey {
    /**
     Computes lexical similarity value in the range [0,1]
     - parameter first: String to compare
     - parameter second: String to compate against
     - returns: similarity value in the range [0,1]
     */
    public static func compare(_ first: String, with second: String) -> Double {
        let firstPairs = wordLetterPairs(first.uppercased())
        var secondPairs = wordLetterPairs(second.uppercased())

        let union = Double(firstPairs.count + secondPairs.count)
        var intersection = 0

        for firstPair in firstPairs {
            for (index, secondPair) in secondPairs.enumerated() {
                if firstPair == secondPair {
                    intersection += 1
                    secondPairs.remove(at: index)
                    break
                }
            }
        }

        return Double(2*intersection)/union
    }

    /**
     Returns an array of 2-character strings for every word in input string.
     */
    private static func wordLetterPairs(_ input: String) -> [String] {
        // Split on whitespace to find all words
        let words = input.characters.split(separator: " ")

        // And convert each word into letter pairs
        return words.flatMap { letterPairs(String($0)) }
    }

    /**
     Returns an array of adjacent letter pairs contained in the input string
     */
    private static func letterPairs(_ input: String) -> [String] {
        let range = 0..<input.characters.count - 1

        // Go through every letter and group them in groups of 2
        return range.map { (i) -> String in
            let start = input.index(input.startIndex, offsetBy: i)
            let end = input.index(start, offsetBy: 2)
            return input.substring(with: start..<end)
        }
    }
}

extension String {
    /**
     Computes lexical similarity value in the range [0,1]
     - parameter other: String to compare against
     - returns: similarity value in the range [0,1]
     */
    public func similarity(with other: String) -> Double {
        return Dicey.compare(self, with: other)
    }
}
