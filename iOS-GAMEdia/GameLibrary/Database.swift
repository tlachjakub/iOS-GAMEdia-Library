//
//  Database.swift
//  GameLibrary
//
//  Created by Jakub Tlach on 10/17/17.
//  Copyright © 2017 Jakub Tlach. All rights reserved.
//

import UIKit

class Database: NSObject {
	
	static let shared = Database()
	static var games: [Game] = []

	let documentsURL: URL
	let databaseURL: URL
	
	
	override init() {
	
		// Get the path
		let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		documentsURL = urls[urls.endIndex-1]
		databaseURL = documentsURL.appendingPathComponent("data")
		let dataList = NSArray(contentsOf: databaseURL) as? [NSDictionary] ?? NSArray(contentsOf: Bundle.main.url(forResource: "list", withExtension: "plist")!)! as! [NSDictionary]
		
		// Load the data
		for item in dataList {
			
			let name = item["name"] as? String ?? ""
			let info = item["information"] as? String ?? ""
			let score = item["score"] as? Int ?? 0
			let image = item["image"] as? String ?? ""
			
			if let game = Game(name: name, info: info, imagePath: image, rating: score) {
				Database.games.append(game)
			}
		}
		super.init()
	}
	
	// Save the data
	func save() {
		
		let dataList: NSMutableArray = []
		for game in Database.games {
			let data: [String: Any] = ["name": game.name,
			                           "information": game.info,
			                           "score": game.rating,
			                           "image": game.imagePath]
			dataList.add(data)
		}
		dataList.write(to: databaseURL, atomically: true)
		
		print("Saved")
	}
}
