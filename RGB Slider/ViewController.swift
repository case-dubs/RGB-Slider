//
//  ViewController.swift
//  RGB Slider
//
//  Created by Casey Wilson on 11/14/15.
//  Copyright © 2015 Caseys Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Variables
    
    @IBOutlet weak var redSelection: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenSelection: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueSelection: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var colorOutputBox: UIView!
    
    //MARK: Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = NSUserDefaults.standardUserDefaults()
        redSelection.value = defaults.floatForKey("red")
        greenSelection.value = defaults.floatForKey("green")
        blueSelection.value = defaults.floatForKey("blue")
        redLabel.text = String(Int(defaults.floatForKey("red")))
        blueLabel.text = String(Int(defaults.floatForKey("blue")))
        greenLabel.text = String(Int( defaults.floatForKey("green")))
        colorOutputBox.backgroundColor = UIColor(red: CGFloat(defaults.floatForKey("red")/250), green: CGFloat(defaults.floatForKey("green")/250), blue: CGFloat(defaults.floatForKey("blue")/250), alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "openColor"){
            let newViewController = segue.destinationViewController
            newViewController.view.backgroundColor = colorOutputBox.backgroundColor
        }
    }
    
    func updateColorLabels(red: Float, blue: Float, green: Float){
        redLabel.text = String(Int(red))
        blueLabel.text = String(Int(blue))
        greenLabel.text = String(Int(green))
    }
    @IBAction func updateBackgroundColor(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()  //1
        defaults.setFloat(redSelection.value, forKey: "red")   //2
        defaults.setFloat(greenSelection.value, forKey: "green")
        defaults.setFloat(blueSelection.value, forKey: "blue")
        defaults.synchronize()
        colorOutputBox.backgroundColor = UIColor(red: CGFloat(defaults.floatForKey("red")/250), green: CGFloat(defaults.floatForKey("green")/250), blue: CGFloat(defaults.floatForKey("blue")/250), alpha: 1.0)
        updateColorLabels(defaults.floatForKey("red"), blue: defaults.floatForKey("blue"), green: defaults.floatForKey("green"))
        
    }
    


}

