//
//  NewViewController.swift
//  Views Demo
//
//  Created by Avikant Saini on 10/1/16.
//  Copyright © 2016 avikantz. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
	
	var passedText: String = "" /* {
		didSet {
			textLabel.text = passedText
		}
	} */
	
	@IBOutlet weak var textLabel: UILabel!
	

    override func viewDidLoad() {
        super.viewDidLoad()

		textLabel.text = passedText
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func takeMeBackAction(_ sender: AnyObject) {
		self.dismiss(animated: true, completion: nil)
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
