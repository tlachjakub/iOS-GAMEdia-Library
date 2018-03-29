//
//  GameTableViewController.swift
//  GameLibrary
//
//  Created by Jakub Tlach on 10/18/17.
//  Copyright © 2017 Jakub Tlach. All rights reserved.
//

import UIKit

class GameTableViewController: UITableViewController {
	
	var game: Game? = nil
	@IBOutlet weak var controller: UIViewController!
	//let cellSpacingHeight: CGFloat = 5
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		tableView.reloadData()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
//		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//		tableView.delegate = self
//		tableView.dataSource = self
		
		
		// Add background view to the table view
		let backgroundImage = UIImage(named: "background.png")
		let imageView = UIImageView(image: backgroundImage)
		self.tableView.backgroundView = imageView
		imageView.contentMode = .scaleAspectFill
	
		
		// Add blur effect
		let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
		let blurView = UIVisualEffectView(effect: blurEffect)
		blurView.frame = imageView.bounds
		imageView.addSubview(blurView)
	}
	
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Database.games.count
    }

	// Set the spacing between sections
	//override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
	//	return cellSpacingHeight
	//}
	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let index = indexPath.row
		
		if let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as? GameTableViewCell {
			//cell.backgroundColor = UIColor(white: 1, alpha: 0.3)
			//cell.layer.borderColor = UIColor.black.cgColor
			//cell.layer.borderWidth = 3
			//cell.layer.cornerRadius = 16
			//cell.clipsToBounds = true
			cell.game = Database.games[index]
			
			return cell
		}
		
		// Escape value
		return UITableViewCell()
    }
	
	// Method to run when table view cell is tapped
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		print("You tapped cell number \(indexPath.row)")
		
		//if let editController = controller.storyboard?.instantiateViewController(withIdentifier: "EditGameViewController") as? EditGameViewController {
		//
		//	editController.game = game
		//	controller.navigationController?.pushViewController(editController, animated: true)
		//}
	}
	
//	 Detection of the row
//	 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//		//if editingStyle == UITableViewCellEditingStyle.delete {
//		//	tableView.deleteRows(at: [indexPath as IndexPath], with: )
//		//}
//		print("DELETE button")
//		if editingStyle == .delete {
//
//			// remove the idem from the data model
//			Database.games.remove(at: indexPath.row)
//
//			// delete the table view row
//			//tableView.deleteRows(at: [indexPath], with: .fade)
//			tableView.deleteRows(at: [indexPath], with: .automatic)
//
//			//tableView.reloadData()
//			print("DELETE button pressed")
//
//		} else if editingStyle == .insert {
//			// Not used in our example, but if you were adding a new row -> this part
//
//			print("edit")
//
//		}
//		print("I should see delete button")
//	}
	
	override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

		let deleteAction = UIContextualAction(style: .normal, title: "Delete", handler: {(ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in

			// Remove the idem from the data model
			Database.games.remove(at: indexPath.row)
			
			// Delete the table view row
			tableView.deleteRows(at: [indexPath], with: .automatic)
			
			print("DELETE button pressed")

			success (true)
		})
		deleteAction.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)

		return UISwipeActionsConfiguration(actions: [deleteAction])

	}
	
	override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

		let editAction = UIContextualAction(style: .normal, title:  "Edit", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in

			if let editController = self.storyboard?.instantiateViewController(withIdentifier: "EditGameViewController") as? EditGameViewController {
				editController.game = Database.games[indexPath.row]
				self.navigationController?.pushViewController(editController, animated: true)
			}
			
			success(true)
		})
		editAction.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)

		return UISwipeActionsConfiguration(actions: [editAction])
	}
	
}
