//
//  Vector4Float.swift
//  FloatVector
//
//  Created by Green2, David on 10/17/14.
//  Copyright (c) 2014 Digital Worlds. All rights reserved.
//

import Foundation

//
// MARK: - Definition and initializes -
//
public struct Vector4Float {
	let x: Float
	let y: Float
	let z: Float
	let w: Float
	
	public init(_ x: Float, _ y: Float, _ z: Float, _ w: Float) {
		self.x = x
		self.y = y
		self.z = z
		self.w = w
	}
	
	// Array property
	public subscript (index: Int) -> Float {
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
				fatalError("Index out of bounds accessing Vector4Float")
			}
	}
	
	public func normalize() -> Vector4Float {
		return self * self.length()
	}
	
	public func length() -> Float {
		return sqrt(self.x * self.x + self.y * self.y + self.z * self.z + self.w * self.w)
	}
	
	public func dot(vector: Vector4Float) -> Float {
		let x = self.x * vector.x
		let y = self.y * vector.y
		let z = self.z * vector.z
		let w = self.w * vector.w
		return x + y + z + w
	}
	
	public func cross(vector: Vector4Float) -> Vector4Float {
		let x = (self.x * vector.z) - (self.z * vector.y)
		let y = (self.z * vector.x) - (self.x * vector.z)
		let z = (self.x * vector.y) - (self.y * vector.x)
		let w: Float = 0.0
		return Vector4Float(x, y, z, w)
	}
}

//
// MARK: - Operators -
//
public prefix func - (vector: Vector4Float) -> Vector4Float {
	return Vector4Float(-vector.x, -vector.y, -vector.z, -vector.w)
}

public func + (lhs: Vector4Float, rhs: Vector4Float) -> Vector4Float {
	return Vector4Float(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w)
}

public func += (inout lhs: Vector4Float, rhs: Vector4Float) {
	lhs = Vector4Float(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w)
}

public func + (lhs: Vector4Float, rhs: Float) -> Vector4Float {
	return Vector4Float(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs)
}

public func += (inout lhs: Vector4Float, rhs: Float) {
	lhs = Vector4Float(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs)
}

public func - (lhs: Vector4Float, rhs: Vector4Float) -> Vector4Float {
	return Vector4Float(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w)
}

public func -= (inout lhs: Vector4Float, rhs: Vector4Float) {
	lhs = Vector4Float(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w)
}

public func - (lhs: Vector4Float, rhs: Float) -> Vector4Float {
	return Vector4Float(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs, lhs.w - rhs)
}

public func -= (inout lhs: Vector4Float, rhs: Float) {
	lhs = Vector4Float(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs, lhs.w - rhs)
}

public func * (lhs: Vector4Float, rhs: Vector4Float) -> Vector4Float {
	return Vector4Float(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w)
}

public func *= (inout lhs: Vector4Float, rhs: Vector4Float) {
	lhs = Vector4Float(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w)
}

public func * (lhs: Vector4Float, rhs: Float) -> Vector4Float {
	return Vector4Float(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs)
}

public func *= (inout lhs: Vector4Float, rhs: Float) {
	lhs = Vector4Float(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs)
}

public func / (lhs: Vector4Float, rhs: Vector4Float) -> Vector4Float {
	return Vector4Float(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w)
}

public func /= (inout lhs: Vector4Float, rhs: Vector4Float) {
	lhs = Vector4Float(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w)
}

public func / (lhs: Vector4Float, rhs: Float) -> Vector4Float {
	return Vector4Float(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs)
}

public func /= (inout lhs: Vector4Float, rhs: Float) {
	lhs = Vector4Float(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs)
}

public func == (lhs: Vector4Float, rhs: Vector4Float) -> Bool {
	return (lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w)
}

public func == (lhs: Vector4Float, rhs: Float) -> Bool {
	return (lhs.x == rhs && lhs.y == rhs && lhs.z == rhs && lhs.w == rhs)
}

public func > (lhs: Vector4Float, rhs: Vector4Float) -> Bool {
	return (lhs.x > rhs.x && lhs.y > rhs.y && lhs.z > rhs.z && lhs.w > rhs.w)
}

public func > (lhs: Vector4Float, rhs: Float) -> Bool {
	return (lhs.x > rhs && lhs.y > rhs && lhs.z > rhs && lhs.w > rhs)
}

public func < (lhs: Vector4Float, rhs: Vector4Float) -> Bool {
	return (lhs.x < rhs.x && lhs.y < rhs.y && lhs.z < rhs.z && lhs.w < rhs.w)
}

public func < (lhs: Vector4Float, rhs: Float) -> Bool {
	return (lhs.x < rhs && lhs.y < rhs && lhs.z < rhs && lhs.w < rhs)
}

public func >= (lhs: Vector4Float, rhs: Vector4Float) -> Bool {
	return (lhs.x >= rhs.x && lhs.y >= rhs.y && lhs.z >= rhs.z && lhs.w >= rhs.w)
}

public func >= (lhs: Vector4Float, rhs: Float) -> Bool {
	return (lhs.x >= rhs && lhs.y >= rhs && lhs.z >= rhs && lhs.w >= rhs)
}

public func <= (lhs: Vector4Float, rhs: Vector4Float) -> Bool {
	return (lhs.x <= rhs.x && lhs.y <= rhs.y && lhs.z <= rhs.z && lhs.w <= rhs.w)
}

public func <= (lhs: Vector4Float, rhs: Float) -> Bool {
	return (lhs.x <= rhs && lhs.y <= rhs && lhs.z <= rhs && lhs.w <= rhs)
}


public func max(lhs: Vector4Float, rhs: Vector4Float) -> Vector4Float {
	return Vector4Float(
		lhs.x > rhs.x ? lhs.x : rhs.x,
		lhs.y > rhs.y ? lhs.y : rhs.y, 
		lhs.z > rhs.z ? lhs.z : rhs.z, 
		lhs.w > rhs.w ? lhs.w : rhs.w)
}

public func min(lhs: Vector4Float, rhs: Vector4Float) -> Vector4Float {
	return Vector4Float(
		lhs.x < rhs.x ? lhs.x : rhs.x, 
		lhs.y < rhs.y ? lhs.y : rhs.y, 
		lhs.z < rhs.z ? lhs.z : rhs.z, 
		lhs.w < rhs.w ? lhs.w : rhs.w)
}