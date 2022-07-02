//
//  ViewController.swift
//  RGBtoHex
//
//  Created by oktay on 2.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var greenLabel: UITextField!
    @IBOutlet weak var blueLabel: UITextField!
    @IBOutlet weak var redLabel: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var colorResultFrame: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    var index : Int = 0;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func segmentChangeAction(_ sender: UISegmentedControl) {
        
        resultLabel.text?.removeAll()
        greenLabel.text?.removeAll()
        redLabel.text?.removeAll()
        blueLabel.text?.removeAll()
        colorResultFrame.backgroundColor = UIColor.white
        index = sender.selectedSegmentIndex
        switch(index){
            
        case 0 :
            convertButton.setTitle("RGB - HEX", for: UIControl.State.normal)
            break
        case 1:
            convertButton.setTitle("HEX - RGB", for: UIControl.State.normal)
            break
            
        default:
            
            break
        }
        
    }
    
    
    @IBAction func btnConvertAction(_ sender: Any) {
        
        
        if (index == 0){
            
            convertRgbToHex()
            
        }else {
            convertHexToRgb()
        }
    }
    
    func convertRgbToHex(){
        guard let redValue = UInt8(redLabel.text!) else {return}
        guard let greenValue = UInt8(greenLabel.text!) else {return}
        guard let blueValue = UInt8(blueLabel.text!) else {return}
        
        
        let redHex = String(format: "%2X", redValue)
        let greenHex = String(format: "%2X", greenValue)
        let blueHex  = String(format: "%2X", blueValue)
        
        resultLabel.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
        resultLabel.backgroundColor = UIColor(red:CGFloat(redValue)/255, green:CGFloat(greenValue)/255, blue:CGFloat(blueValue)/255, alpha:CGFloat(1))
        colorResultFrame.backgroundColor = UIColor(red:CGFloat(redValue)/255, green:CGFloat(greenValue)/255, blue:CGFloat(blueValue)/255, alpha:CGFloat(1))
    }
    
    func convertHexToRgb(){
        
        if let redValue = UInt8(redLabel.text!, radix: 16){
            
            if let greenValue = UInt8(greenLabel.text!, radix: 16){
                
                if let blueValue = UInt8(blueLabel.text!, radix: 16) {
                    resultLabel.text = "RED: \(redValue) \n GREEN: \(greenValue) \n BLUE:  \(blueValue)"
                    resultLabel.backgroundColor = UIColor(red:CGFloat(redValue)/255, green:CGFloat(greenValue)/255, blue:CGFloat(blueValue)/255, alpha:CGFloat(1))
                    colorResultFrame.backgroundColor = UIColor(red:CGFloat(redValue)/255, green:CGFloat(greenValue)/255, blue:CGFloat(blueValue)/255, alpha:CGFloat(1))
                }
            }
            
        }
    }
    
}

