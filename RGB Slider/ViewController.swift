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
        colorOutputBox.backgroundColor = UIColor(red: CGFloat(186)/255, green: CGFloat(221)/255, blue: CGFloat(188)/255, alpha: 1.0)
        colorOutputBox.layer.borderColor = UIColor.blackColor().CGColor
        colorOutputBox.layer.borderWidth = 1
        // Do any additional setup after loading the view, typically from a nib.
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
        let red = redSelection.value
        let green = greenSelection.value
        let blue = blueSelection.value
        colorOutputBox.backgroundColor = UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1.0)
        updateColorLabels(red, blue: blue, green: green)
    }
    


}

