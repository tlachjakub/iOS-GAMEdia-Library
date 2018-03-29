//
//  ViewController.swift
//  GameLibrary
//
//  Created by Jakub Tlach on 10/13/17.
//  Copyright © 2017 Jakub Tlach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		_ = Database.shared
		
		for game in Database.games {
			
			print("Name = \(game.name)")
			
		}

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: Actions
	
	

}

