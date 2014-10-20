//
//  VectorTestTests.swift
//  VectorTestTests
//
//  Created by Green2, David on 10/20/14.
//  Copyright (c) 2014 Digital Worlds. All rights reserved.
//

import UIKit
import XCTest

class VectorTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testGenericPerformance() {
        // This is an example of a performance test case.
		self.measureBlock() {
			for i in 0...1000000 {
				let vec1 = Vector4Generic<Float>(Float(arc4random()), Float(arc4random()), Float(arc4random()), Float(arc4random()))
				let vec2 = Vector4Generic<Float>(Float(arc4random()), Float(arc4random()), Float(arc4random()), Float(arc4random()))
				let vec3 = vec1 * vec2
			}
		}
    }
	func testFloatPerformance() {
		// This is an example of a performance test case.
		self.measureBlock() {
			for i in 0...1000000 {
				let vec1 = Vector4Float(Float(arc4random()), Float(arc4random()), Float(arc4random()), Float(arc4random()))
				let vec2 = Vector4Float(Float(arc4random()), Float(arc4random()), Float(arc4random()), Float(arc4random()))
				let vec3 = vec1 * vec2
			}
		}
	}
}
