//
//  ViewController.swift
//  VectorTest
//
//  Created by Green2, David on 10/20/14.
//  Copyright (c) 2014 Digital Worlds. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Instantiate some vectors for testing purposes
		let vec1 = Vector4Float(1.0, 1.0, 1.0, 0.0)
		let vec2 = Vector4Float(2.0, 3.0, 4.0, 5.0)
		var vec3 = vec1 + vec2
		vec3 += vec2
		
		let vec1g = Vector4Generic<Double>(1.0, 1.0, 1.0, 2.0)
		let vec2g = Vector4Generic<Double>(2.0, 3.0, 4.5, 6.25)
		var vec3g = vec1g + vec2g
		vec3g += vec2g
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

