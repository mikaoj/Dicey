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
