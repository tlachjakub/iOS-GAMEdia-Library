//
//  Game.swift
//  GameLibrary
//
//  Created by Jakub Tlach on 10/18/17.
//  Copyright © 2017 Jakub Tlach. All rights reserved.
//

import UIKit

class Game {
	
	// MARK: Properties
	
	var name: String
	var info: String
	var rating: Int
	
	var imagePath: String {
		didSet {
			_image = nil
		}
	}
	
	private var _image: UIImage?
	var image: UIImage? {
		
		// Cached? Return
		if let file = _image {
			return file
		}
		
		// Load Image
		if imagePath.hasPrefix("http") {
			if let url = URL(string: imagePath) {
				if let data = try? Data(contentsOf: url) {
					_image = UIImage(data: data)
				}
			}

		} else {
			_image = UIImage(named: imagePath)
		}
		
		return _image
	}
	

	// MARK: Initialization
	
	init?(name: String, info: String, imagePath: String, rating: Int) {
		
		// Check if all elements are right
		//if name.isEmpty || info.isEmpty || rating < 0 {
		//	return nil
		//}
		
		// Check if all elements are right
		guard !name.isEmpty || !info.isEmpty else {
			print("Invalid name or info")
			return nil
		}
		
		guard (rating >= 0) && (rating <= 5) else {
			print("Invalid score: \(rating)")
			return nil
		}

		// Initialize stored properties
		self.name = name
		self.info = info
		self.rating = rating
		self.imagePath = imagePath
	}
	
}






