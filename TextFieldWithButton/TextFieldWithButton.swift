//
//  TextFieldWithButton.swift
//  TextFieldWithButton
//
//  Created by Manraaj Nijjar on 1/21/18.
//  Copyright © 2018 Manraaj Nijjar. All rights reserved.
//

import UIKit
@IBDesignable
class TextFieldWithButton: UIControl {
    
    var textField: UITextField!
    var textFieldInPlace: Bool = false
    
    var button: UIButton!
    var buttonSize: CGFloat!
    var buttonInPlace: Bool = false
    
    var buttonFunction : (()  -> Void)!
    
    var initialBorderColor: CGColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 0, 0, 0])!
    
    public var targetTextField: UITextField? = nil
    
    @IBAction func doSomething(sender: UIButton, forEvent event: UIEvent){
        
    }
    
    @IBInspectable
    var roundedCorners: Bool = false {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: CGColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 0, 0, 0])! {
        didSet {
            layer.borderColor = borderColor
        }
    }
    
    @IBInspectable
    var buttonOnLeft: Bool = false {
        didSet {
            buttonSize = layer.frame.size.height * 0.8
            var buttonDescent = (layer.frame.size.height * 0.2) / 2
            
            if buttonOnLeft == true {
                button = UIButton(frame: CGRect(x: 0, y: buttonDescent, width: buttonSize, height: buttonSize))
            }
            
            if buttonOnLeft == false {
                button = UIButton(frame: CGRect(x: layer.frame.width - (buttonSize * 1.1), y: buttonDescent, width: buttonSize, height: buttonSize))
            }
            button.layer.cornerRadius = buttonSize / 2
            //button.backgroundColor = UIColor.blue
            
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            
            addSubview(button!)
            bringSubview(toFront: button)
        }
    }
    
    @IBInspectable
    var buttonImage: UIImage? = nil {
        didSet {
            button.setImage(buttonImage, for: .normal)
            print("hello")
            button.contentMode = .scaleAspectFit
        }
    }
    
    
    func updateView() {
        textField = UITextField(frame: CGRect(x: 0, y: 0, width: frame.width - (frame.height * 1.1), height: frame.height))
        
        layer.cornerRadius = 10
        
        addSubview(textField)
        
    }
    
    /*override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        
    } */
    
    
    
    @objc func buttonTapped(button: UIButton){
        buttonFunction()
    }

}

