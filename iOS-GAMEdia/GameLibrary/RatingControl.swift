//
//  RatingControl.swift
//  GameLibrary
//
//  Created by Jakub Tlach on 10/17/17.
//  Copyright © 2017 Jakub Tlach. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
	
	//////////////////////////////////////////////////////////////////////////////////
	// MARK: Properties
	//////////////////////////////////////////////////////////////////////////////////
	
	private var ratingButtons = [UIButton]()
	
	//var selectedRating = 0
	
	var rating = 0 {
		didSet {
			updateButtonSelectionStates()
		}
	}
	
	@IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
		didSet {
			setupButtons()
		}
	}
	
	@IBInspectable var starCount: Int = 5 {
		didSet {
			setupButtons()
		}
	}

	//////////////////////////////////////////////////////////////////////////////////
    // MARK: Initialization
	//////////////////////////////////////////////////////////////////////////////////
	
	override init(frame: CGRect) {
		
		super.init(frame: frame)
		setupButtons()
	}
	
	required init(coder: NSCoder) {
		
		super.init(coder: coder)
		setupButtons()
	}

	//////////////////////////////////////////////////////////////////////////////////
	// MARK: Button Action
	//////////////////////////////////////////////////////////////////////////////////
	
	@objc func ratingButtonTapped(button: UIButton) {
		//print("Button pressed")
		print("Old rating = \(rating)")
		
		guard let index = ratingButtons.index(of: button) else {
			fatalError("The button, \(button) is not in the ratingButtons array: \(ratingButtons)")
		}
		
		
		// Calculate the rating of the selected button
		//selectedRating = index
		
		
		// Automatic selection of stars
		//for (index, button) in ratingButtons.enumerated() {
			//if index <= selectedRating {
			//	button.isSelected = true
			//} else {
			//	button.isSelected = false
			//}
		//	if (selectedRating + 1) == rating {
		//		button.isSelected = false
		//	} else {
		//		button.isSelected = index <= selectedRating
		//	}
		//}
		//updateButtonSelectionStates()
		
		// Change the rating
		if (index + 1) == rating {
			rating = 0
		} else {
			rating = index + 1
		}
		print("Rating = \(rating)")
		
		
		// Set the hint string for the currently selected star
		let hintString: String?
		if rating == index + 1 {
			hintString = "Tap to reset the rating to zero"
		} else {
			hintString = nil
		}
		
		
		// Calculate the value string
		let valueString: String
		switch (rating) {
		case 0:
			valueString = "No rating set."
		case 1:
			valueString = "1 star set."
		default:
			valueString = "\(rating) stars set."
		}
		
		
		// Assign the hint string and value string
		button.accessibilityValue = valueString
		button.accessibilityHint = hintString
	}

	//////////////////////////////////////////////////////////////////////////////////
	// MARK: Private Methods
	//////////////////////////////////////////////////////////////////////////////////
	
	private func setupButtons() {
		
		// Clear any existing buttons
		for button in ratingButtons {
			removeArrangedSubview(button)
			button.removeFromSuperview()
		}
		ratingButtons.removeAll()
		
		// Load Button Images
		//let bundle = Bundle(for: type(of: self))
		//let #imageLiteral(resourceName: "staron") = UIImage(named: "staron", in: bundle, compatibleWith: self.traitCollection)
		//let #imageLiteral(resourceName: "staroff") = UIImage(named: "staroff", in: bundle, compatibleWith: self.traitCollection)
		
		for index in 0 ..< starCount {
			
			// Create button
			let button = UIButton()
			//button.backgroundColor = UIColor.red
			
			// Add constraints
			button.translatesAutoresizingMaskIntoConstraints = false
			button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
			button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
			
			// Set the button images
			button.setImage(#imageLiteral(resourceName: "staroff"), for: .normal)
			button.setImage(#imageLiteral(resourceName: "staron"), for: .selected)
			button.contentMode = .scaleAspectFit
			
			// Set the accessibility label
			button.accessibilityLabel = "Set \(index + 1) star rating"
			
			// Setup the button action
			button.addTarget(self, action:
				#selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
			
			// Add the button to the stack
			addArrangedSubview(button)
			
			// Add the new button to the rating button array
			ratingButtons.append(button)
		}
		
		updateButtonSelectionStates()
		
	}

	private func updateButtonSelectionStates() {
		for (index, button) in ratingButtons.enumerated() {
			
			// Select only starts < than selection
			button.isSelected = index < rating
		}
	}
}
