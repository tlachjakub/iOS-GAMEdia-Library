//
//  AddGameViewController.swift
//  GameLibrary
//
//  Created by Jakub Tlach on 10/17/17.
//  Copyright © 2017 Jakub Tlach. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {

	@IBOutlet weak var nameText: UITextField!
	@IBOutlet weak var linkText: UITextField!
	@IBOutlet weak var infoText: UITextField!
	@IBOutlet weak var addGameButton: UIBarButtonItem!
	@IBOutlet weak var ratingControl: RatingControl!
	
	@IBAction func addGameAction(_ sender: Any) {
		
		if nameText.text == "" {
			
			let alert = UIAlertController(title: "Name?", message: "Please enter the name!", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			self.present(alert, animated: true, completion: nil)
			nameText.becomeFirstResponder()

		} else if linkText.text == "" {
			
			let alert = UIAlertController(title: "Link?", message: "Please enter the link on image!", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			self.present(alert, animated: true, completion: nil)
			
		} else if infoText.text == "" {
			
			let alert = UIAlertController(title: "Information?", message: "Please enter the information!", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			self.present(alert, animated: true, completion: nil)
			
		} else {
			
			if let game = Game(
				name: nameText.text!,
				info: infoText.text!,
				imagePath: linkText.text!,
				rating: ratingControl.rating ) {
				
				Database.games.append(game)
			}
			self.navigationController?.popViewController(animated: true)
		}
	}
}
