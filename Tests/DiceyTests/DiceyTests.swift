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

import XCTest
@testable import Dicey

class DiceyTests: XCTestCase {
    func testWordSimilarity() {
        // Compare some known words against
        // 'Healed' and verify their similarity
        let base = "Healed"
        let input = ["Sealed", "Healthy", "Heard", "Herded", "Help", "Sold"]
        let expected = [80, 55, 44, 40, 25, 0]

        let result = input.map {
            return Int(round($0.similarity(with: base) * 100))
        }

        XCTAssertEqual(expected, result)
    }

    func testSentenceSimilarity() {
        // Compare some known sentences against
        // 'Web Database Applications' and verify their similarity
        let base = "Web Database Applications"
        let input = [
            "Web Database Applications with PHP & MySQL", 
            "Creating Database Web Applications with PHP and ASP",
            "Building Database Applications on the Web Using PHP3",
            "Building Web Database Applications with Visual Studio 6",
            "Web Application Development With PHP",
            "WebRAD: Building Database Applications on the Web with Visual FoxPro and Web Connection",
            "Structural Assessment: The Role of Large and Full-Scale Testing",
            "How to Find a Scholarship Online",
          ]
        let expected = [
            82,
            71, 
            70, 
            67, 
            51, 
            49, 
            12, 
            10,
          ]

        let result = input.map {
            return Int(round($0.similarity(with: base) * 100))
        }

        XCTAssertEqual(expected, result)
    }

    static var allTests : [(String, (DiceyTests) -> () throws -> Void)] {
        return [
            ("testWordSimilarity", testWordSimilarity),
            ("testSentenceSimilarity", testSentenceSimilarity),
        ]
    }
}
