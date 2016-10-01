//
//  ViewController.swift
//  Views Demo
//
//  Created by Avikant Saini on 10/1/16.
//  Copyright © 2016 avikantz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var textLabel: UILabel!
	
	@IBOutlet weak var myButton: UIButton!
	
	@IBOutlet weak var segControl: UISegmentedControl!
	
	@IBOutlet weak var slider: UISlider!
	
	@IBOutlet weak var imageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	@IBAction func buttonPressed(_ sender: AnyObject) {
		textLabel.text = "Button pressed."
	}
	
	@IBAction func segmentedControlValueChanged(_ sender: AnyObject) {
		textLabel.text = "Segmented control selected: \(segControl.selectedSegmentIndex)"
		
		if segControl.selectedSegmentIndex == 0 {
			imageView.image = UIImage(named: "417933.jpg")
		} else {
			imageView.image = UIImage(named: "683066.png")
		}
		
	}
	
	@IBAction func sliderSlided(_ sender: AnyObject) {
		textLabel.text = "Slider value = \(slider.value)"
	}
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "NewViewSegue" {
			let newVC = segue.destination as! NewViewController
			newVC.passedText = textLabel.text!
		}
	}

}

