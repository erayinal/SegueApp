//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Eray İnal on 30.10.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var myName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = myName

        
        
    }
    


}
