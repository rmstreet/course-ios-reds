//
//  ViewController.swift
//  Thot
//
//  Created by user139984 on 7/5/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()



        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonSignInTapped() {
        debugPrint("Button tapped!!!")
    }

}

