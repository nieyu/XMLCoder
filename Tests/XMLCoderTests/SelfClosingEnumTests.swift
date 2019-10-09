//
//  SelfClosingEnumTests.swift
//  XMLCoderTests
//
//  Created by James Bean on 10/9/19.
//

import XCTest
import XMLCoder

class SelfClosingEnumTests: XCTestCase {

    enum Fruit: String, Equatable, Codable {
        case apple
        case orange
    }

    let fruitsXML = """
    <fruits>
        <apple/>
        <orange/>
    </fruits>
    """

    func testFruitsDecoding() throws {
        let decoded = try XMLDecoder().decode([Fruit].self, from: fruitsXML.data(using: .utf8)!)
        XCTAssertEqual(decoded, [.apple, .orange])
    }
}
