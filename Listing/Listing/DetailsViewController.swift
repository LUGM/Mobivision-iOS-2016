//
//  DetailsViewController.swift
//  Listing
//
//  Created by Avikant Saini on 10/4/16.
//  Copyright © 2016 avikantz. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
	
	var movieName: String = ""
	
	var actualName: String = ""
	var yearReleased: String = ""
	
	@IBOutlet weak var releasedLabel: UILabel!
	@IBOutlet weak var directorLabel: UILabel!
	@IBOutlet weak var castLabel: UILabel!
	@IBOutlet weak var ratingLabel: UILabel!
	@IBOutlet weak var genresLabel: UILabel!
	@IBOutlet weak var plotLabel: UILabel!
	
	@IBOutlet weak var posterImageView: UIImageView!
	
	@IBOutlet weak var moreButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.navigationItem.title = movieName
		
		// Just a precaution
		let length = movieName.characters.count
		if length > 6 {
			
			// Example name: "Interstellar (2014)"
			
			let nameIndex = movieName.index(movieName.startIndex, offsetBy: length-7)
			actualName = movieName.substring(to: nameIndex)
			
			let yearIndex1 = movieName.index(movieName.endIndex, offsetBy: -5)
			let yearIndex2 = movieName.index(movieName.endIndex, offsetBy: -1)
			let range = yearIndex1..<yearIndex2
			yearReleased = movieName.substring(with: range)
			
			print("Actual name: \(actualName), year: \(yearReleased)")
			
		}
	
		
		let URLString = "http://www.omdbapi.com/?t=\(actualName.replacingOccurrences(of: " ", with: "%20"))&y=\(yearReleased)&plot=full&r=json"
		
		let url = URL(string: URLString)
		
		let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
			
			if error == nil {
				
				do {
				
					let details = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: String]
					
					print(details)
					
					self.castLabel.text = details["Actors"]
					self.plotLabel.text = details["Plot"]
					self.genresLabel.text = details["Genre"]
					self.releasedLabel.text = details["Released"]
					self.ratingLabel.text = details["Rated"]
					self.directorLabel.text = details["Director"]
					
					let imageLocation = details["Poster"]
					self.fetchImage(imageLocation: imageLocation!)
					
					
				} catch _ {
					
				}
				
			}
			
		}
		
		task.resume()
		
    }
	
	func fetchImage(imageLocation: String) {
		
		let url = URL(string: imageLocation)
		
		let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
			
			if error == nil {
					
				let image = UIImage(data: data!)
				self.posterImageView.image = image
				
			}
			
		}
		
		task.resume()
		
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	@IBAction func moreAction(_ sender: AnyObject) {
		
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
