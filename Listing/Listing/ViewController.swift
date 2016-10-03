//
//  ViewController.swift
//  Listing
//
//  Created by Avikant Saini on 10/3/16.
//  Copyright © 2016 avikantz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var tableView: UITableView!
	
	
	var moovies: [String: [String]] = [:] // Dictionary to hold all movies
	
	var titles: [String] = [] // Array to hold titles of the movies

	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		do {
			
			let file = Bundle.main.path(forResource: "Movies", ofType: "dat") // Get filepath of the included file as string, from Bundle
			
			let url = URL(fileURLWithPath: file!) // Get URL of the filepath, of the sort file:///
			
			let data = try Data(contentsOf: url) // Get binary data contents of the file
			
			let movies = try JSONSerialization.jsonObject(with: data) // Serialize the data

			moovies = movies as! [String: [String]]	// Parse the seralized data into the moovies dictonary
			
			// Loop through all the keys of the dictionary and add them to the titles array
			for key in moovies.keys {
				titles.append(key)
			}
			
			// Sort the titles array
			titles.sort()
			
//			print(movies)
			
		} catch _ {
			
			print("error occured")
			
		}
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func barButtonPressed(_ sender: AnyObject) {
		
		let alertController = UIAlertController(title: "Information", message: "YOU WILL SEE THIS ALERT!", preferredStyle: .alert)
		
		let cancelAction = UIAlertAction(title: "NOOOOOOOO!", style: .cancel, handler: nil)
		alertController.addAction(cancelAction)
		
//		self.present(alertController, animated: true, completion: nil)
		self.present(alertController, animated: true) { 
			print("Presented")
		}
		
	}
	
	
	// Table view datasource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		
		// return the number of titles
		return titles.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		// title for this section
		let title = self.tableView(tableView, titleForHeaderInSection: section)
		
		// Get the list of movies for this section
		let moviesForTitle = moovies[title!]
		
		// return the count
		return moviesForTitle!.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "listingCell", for: indexPath)

//		cell.textLabel?.text = "Row \(indexPath.row)"
//		cell.detailTextLabel?.text = "Section \(indexPath.section)"
		
		// title for this section
		let title = self.tableView(tableView, titleForHeaderInSection: indexPath.section)
		
		// Get the list of movies for this section
		let moviesForTitle = moovies[title!]
		
		// Get the movie name from the list
		let movieName = moviesForTitle![indexPath.row]
		
		cell.textLabel?.text = movieName
		cell.detailTextLabel?.text = ""
		
		return cell
		
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		// return the title of the section
		return titles[section]
	}
	

}

