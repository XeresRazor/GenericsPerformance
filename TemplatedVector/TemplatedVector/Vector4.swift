//
//  Vector4.swift
//  TemplatedVector
//
//  Created by Green2, David on 10/17/14.
//  Copyright (c) 2014 Digital Worlds. All rights reserved.
//

import Foundation

// Protocols we'll need to implement our templated Vector
// See: http://blog.davidtgreen.net/2014/10/generic-structs-in-swift/

public protocol ArithmeticFloatingPointType: FloatingPointType, FloatLiteralConvertible, Comparable {
	func +(lhs: Self, rhs: Self) -> Self
	func -(lhs: Self, rhs: Self) -> Self
	func *(lhs: Self, rhs: Self) -> Self
	func /(lhs: Self, rhs: Self) -> Self
	prefix func -(lhs: Self) -> Self
	func sqrt() -> Self
}

extension Float: ArithmeticFloatingPointType {
	public func sqrt() -> Float {
		return Foundation.sqrt(self)
	}
}

extension Double: ArithmeticFloatingPointType {
	public func sqrt() -> Double {
		return Foundation.sqrt(self)
	}
}

//
// MARK: - Definition and initializes -
//
public struct Vector4 <T: ArithmeticFloatingPointType> {
	let x: T
	let y: T
	let z: T
	let w: T
	
	public init(_ x: T, _ y: T, _ z: T, _ w: T) {
		self.x = x
		self.y = y
		self.z = z
		self.w = w
	}
	
	// Array property
	public subscript (index: Int) -> T {
		assert(index >= 0 && index < 4, "Index must be in the range 0...3")
			switch index {
			case 0:
				return self.x
			case 1:
				return self.y
			case 2:
				return self.z
			case 3:
				return self.w
			default:
				fatalError("Index out of bounds accessing Vector4")
			}
	}
	
	public func normalize() -> Vector4<T> {
		return self * self.length()
	}
	
	public func length() -> T {
		return (self.x * self.x + self.y * self.y + self.z * self.z + self.w * self.w).sqrt()
	}
	
	public func dot(vector: Vector4<T>) -> T {
		let x = self.x * vector.x
		let y = self.y * vector.y
		let z = self.z * vector.z
		let w = self.w * vector.w
		return x + y + z + w
	}
	
	public func cross(vector: Vector4<T>) -> Vector4<T> {
		let x = (self.x * vector.z) - (self.z * vector.y)
		let y = (self.z * vector.x) - (self.x * vector.z)
		let z = (self.x * vector.y) - (self.y * vector.x)
		let w: T = 0.0
		return Vector4(x, y, z, w)
	}
}

//
// MARK: - Operators -
//
public prefix func - <T: ArithmeticFloatingPointType>(vector: Vector4<T>) -> Vector4<T> {
	return Vector4(-vector.x, -vector.y, -vector.z, -vector.w)
}

public func + <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Vector4<T> {
	return Vector4(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w)
}

public func += <T: ArithmeticFloatingPointType>(inout lhs: Vector4<T>, rhs: Vector4<T>) {
	lhs = Vector4(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w)
}

public func + <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: T) -> Vector4<T> {
	return Vector4(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs)
}

public func += <T: ArithmeticFloatingPointType>(inout lhs: Vector4<T>, rhs: T) {
	lhs = Vector4(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs)
}

public func - <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Vector4<T> {
	return Vector4(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w)
}

public func -= <T: ArithmeticFloatingPointType>(inout lhs: Vector4<T>, rhs: Vector4<T>) {
	lhs = Vector4(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w)
}

public func - <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: T) -> Vector4<T> {
	return Vector4(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs, lhs.w - rhs)
}

public func -= <T: ArithmeticFloatingPointType>(inout lhs: Vector4<T>, rhs: T) {
	lhs = Vector4(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs, lhs.w - rhs)
}

public func * <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Vector4<T> {
	return Vector4(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w)
}

public func *= <T: ArithmeticFloatingPointType>(inout lhs: Vector4<T>, rhs: Vector4<T>) {
	lhs = Vector4(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w)
}

public func * <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: T) -> Vector4<T> {
	return Vector4(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs)
}

public func *= <T: ArithmeticFloatingPointType>(inout lhs: Vector4<T>, rhs: T) {
	lhs = Vector4(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs)
}

public func / <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Vector4<T> {
	return Vector4(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w)
}

public func /= <T: ArithmeticFloatingPointType>(inout lhs: Vector4<T>, rhs: Vector4<T>) {
	lhs = Vector4(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w)
}

public func / <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: T) -> Vector4<T> {
	return Vector4(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs)
}

public func /= <T: ArithmeticFloatingPointType>(inout lhs: Vector4<T>, rhs: T) {
	lhs = Vector4(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs)
}

public func == <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Bool {
	return (lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w)
}

public func == <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: T) -> Bool {
	return (lhs.x == rhs && lhs.y == rhs && lhs.z == rhs && lhs.w == rhs)
}

public func > <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Bool {
	return (lhs.x > rhs.x && lhs.y > rhs.y && lhs.z > rhs.z && lhs.w > rhs.w)
}

public func > <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: T) -> Bool {
	return (lhs.x > rhs && lhs.y > rhs && lhs.z > rhs && lhs.w > rhs)
}

public func < <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Bool {
	return (lhs.x < rhs.x && lhs.y < rhs.y && lhs.z < rhs.z && lhs.w < rhs.w)
}

public func < <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: T) -> Bool {
	return (lhs.x < rhs && lhs.y < rhs && lhs.z < rhs && lhs.w < rhs)
}

public func >= <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Bool {
	return (lhs.x >= rhs.x && lhs.y >= rhs.y && lhs.z >= rhs.z && lhs.w >= rhs.w)
}

public func >= <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: T) -> Bool {
	return (lhs.x >= rhs && lhs.y >= rhs && lhs.z >= rhs && lhs.w >= rhs)
}

public func <= <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Bool {
	return (lhs.x <= rhs.x && lhs.y <= rhs.y && lhs.z <= rhs.z && lhs.w <= rhs.w)
}

public func <= <T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: T) -> Bool {
	return (lhs.x <= rhs && lhs.y <= rhs && lhs.z <= rhs && lhs.w <= rhs)
}


public func max<T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Vector4<T> {
	return Vector4(
		lhs.x > rhs.x ? lhs.x : rhs.x,
		lhs.y > rhs.y ? lhs.y : rhs.y, 
		lhs.z > rhs.z ? lhs.z : rhs.z, 
		lhs.w > rhs.w ? lhs.w : rhs.w)
}

public func min<T: ArithmeticFloatingPointType>(lhs: Vector4<T>, rhs: Vector4<T>) -> Vector4<T> {
	return Vector4(
		lhs.x < rhs.x ? lhs.x : rhs.x, 
		lhs.y < rhs.y ? lhs.y : rhs.y, 
		lhs.z < rhs.z ? lhs.z : rhs.z, 
		lhs.w < rhs.w ? lhs.w : rhs.w)
}