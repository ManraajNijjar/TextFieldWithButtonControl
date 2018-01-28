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
    var buttonOnLeft: Bool = false {
        didSet {
            buttonSize = layer.frame.size.height * 0.8
            var buttonDescent = (layer.frame.size.height * 0.2) / 2
            
            if buttonOnLeft == true {
                button = UIButton(frame: CGRect(x: 0, y: buttonDescent, width: buttonSize, height: buttonSize))
            }
            
            if buttonOnLeft == false {
                button = UIButton(frame: CGRect(x: layer.frame.width - buttonSize, y: buttonDescent, width: buttonSize, height: buttonSize))
            }
            button.layer.cornerRadius = buttonSize / 2
            button.backgroundColor = UIColor.blue
            
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            
            addSubview(button!)
            bringSubview(toFront: button)
        }
    }
    
    @IBInspectable
    var buttonImage: UIImage? = nil {
        didSet {
            button.imageView?.image = buttonImage
            button.contentMode = .scaleAspectFit
        }
    }
    
    
    func updateView() {
        textField = UITextField(frame: CGRect(x: 0, y: 0, width: frame.width - frame.height, height: frame.height))
        layer.borderColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 0.5, 0.5, 1.0])
        addSubview(textField)
        
    }
    
    /*override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        
    } */
    
    
    
    @objc func buttonTapped(button: UIButton){
        buttonFunction()
    }

}

