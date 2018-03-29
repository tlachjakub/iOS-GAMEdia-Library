//
//  EditGameViewController.swift
//  GameLibrary
//
//  Created by Jakub Tlach on 10/19/17.
//  Copyright © 2017 Jakub Tlach. All rights reserved.
//

import UIKit

class EditGameViewController: UIViewController {

	@IBOutlet weak var nameText: UITextField!
	@IBOutlet weak var linkText: UITextField!
	@IBOutlet weak var infoText: UITextField!
	@IBOutlet weak var ratingControl: RatingControl!
	
	var game: Game? = nil
	
	// Load data
	override func viewDidLoad() {
        super.viewDidLoad()
			
		if let data = game {

			//data.name = "BLABLABLA"
			nameText.text = data.name
			linkText.text = data.imagePath
			infoText.text = data.info
			ratingControl.rating = data.rating

		}
    }

	// Save edited data
	@IBAction func editGameButton(_ sender: Any) {
		
		if let data = game {
			
			data.name = nameText.text!
			data.imagePath = linkText.text!
			data.info = infoText.text!
			data.rating = ratingControl.rating
			
		}
		self.navigationController?.popViewController(animated: true)
		
	}
		
	override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
