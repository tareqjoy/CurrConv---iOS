//
//  ViewController.swift
//  highvoltage
//
//  Created by kuet on 23/9/18.
//  Copyright © 2018 kuet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "login_view", sender: self)
    }
    @IBAction func convertTapped(_ sender: Any) {
    }
    
}

