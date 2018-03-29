//
//  GameTableViewCell.swift
//  GameLibrary
//
//  Created by Jakub Tlach on 10/16/17.
//  Copyright © 2017 Jakub Tlach. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
	
	//////////////////////////////////////////////////////////////////////////////////
	// MARK: Properties
	//////////////////////////////////////////////////////////////////////////////////
	
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var ratingControl: RatingControl!
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var controller: UIViewController!

	var game: Game? = nil {
		didSet {
			nameLabel.text = game!.name
			ratingControl.rating = game!.rating
			photoImageView.image = game!.image
		}
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////////
	// MARK: Init
	//////////////////////////////////////////////////////////////////////////////////
	
    override func awakeFromNib() {
        super.awakeFromNib()
				
		self.isExclusiveTouch = true
		
		
		backgroundColor = UIColor(white: 1, alpha: 0.3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
	
		if let editController = controller.storyboard?.instantiateViewController(withIdentifier: "EditGameViewController") as? EditGameViewController {
			editController.game = game
			controller.navigationController?.pushViewController(editController, animated: true)
		}
	}
	
	
}
