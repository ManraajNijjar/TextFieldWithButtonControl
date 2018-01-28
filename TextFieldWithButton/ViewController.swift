//
//  ViewController.swift
//  TextFieldWithButton
//
//  Created by Manraaj Nijjar on 1/18/18.
//  Copyright © 2018 Manraaj Nijjar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFieldWithButton: TextFieldWithButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textFieldWithButton.targetTextField = UITextField()
        textFieldWithButton.buttonFunction = retro
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retro(){
        print("retro")
    }


}

