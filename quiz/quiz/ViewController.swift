//
//  ViewController.swift
//  quiz
//
//  Created by pranjal bharali on 21/03/2018.
//  Copyright © 2018 pranjal bharali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var ferrariImageView: UIImageView!
    @IBOutlet weak var marcedesImageView: UIImageView!
    @IBOutlet weak var outdoorSwitch: UISwitch!
    @IBOutlet weak var outdoorSwitchLabel: UILabel!
    @IBOutlet weak var fastSwitch: UISwitch!
    @IBOutlet weak var fastswitchyesno: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var finalresultLabel: UILabel!
    @IBOutlet weak var Output: UILabel!
    @IBOutlet weak var showResultsbutton: UIButton!
    
    var finalResult : Int = 0
    var outdoorResult : Int = 0
    var fastCarpoints : Int = 0
    var slidepoint : Int = 0
    var ferraripoint : Int = 0
    var marcedespont : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func outdoorSwitchedChange(_ sender: UISwitch) {
        if outdoorSwitch != nil{
            if outdoorSwitch.isOn {
                //we add 5 points
                outdoorResult = 5
                outdoorSwitchLabel.text = "Yes"
            }else{
                outdoorResult = 0
                outdoorSwitchLabel.text = "No"
            }
        }
    }
    @IBAction func fastSwitchChanged(_ sender: UISwitch) {
        if fastSwitch != nil{
            if fastSwitch.isOn {
                //we add 5 points
                fastCarpoints = 5
                fastswitchyesno.text = "Yes"
            }else{
                fastCarpoints = 0
                fastswitchyesno.text = "No"
            }
        }
    }
    @IBAction func sliderChange(_ sender: UISlider) {
        if slider != nil{
            let scalVal = Int(slider.value)
            let maxVal = Int(slider.maximumValue)
            finalresultLabel.text = "\(scalVal) / \(maxVal)"
            slidepoint = scalVal
        
        }
    }
    
    @IBAction func ShowresultButton(_ sender: UIButton) {
        if outdoorSwitch != nil && fastSwitch != nil && slider != nil{
            if outdoorResult <= 0 && fastCarpoints <= 0 && ferraripoint <= 0 {
                Output.text = "please anwser all questions"
               
                
            }else{
                if slidepoint <= 5 {
                    marcedespont = outdoorResult + fastCarpoints + 4
                }else{
                    marcedespont = outdoorResult + fastCarpoints + 0
                    ferraripoint = outdoorResult + fastCarpoints + 4
                }
                if marcedespont > ferraripoint{
                    mainTitleLabel.text = "Marcedes"
                    Output.text = "you are marcedes"
                    ferrariImageView.isHidden = true
                    marcedesImageView.isHidden = false
                    marcedesImageView.backgroundColor = UIColor.yellow
                   
                }else {
                    mainTitleLabel.text = "Ferrari"
                    Output.text = "you are ferrari"
                   marcedesImageView.isHidden = true
                    ferrariImageView.isHidden = false
                    ferrariImageView.backgroundColor = UIColor.white
                    
                }
            }
        }
    }
}

