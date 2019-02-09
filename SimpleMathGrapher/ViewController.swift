//
//  ViewController.swift
//  SimpleMathGrapher
//
//  Created by Michal Takac on 09/02/2019.
//  Copyright © 2019 QuestSpace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var x: UILabel!
    @IBOutlet weak var y: UILabel!
    @IBOutlet weak var z: UILabel!
    
    @IBOutlet weak var XSlider: UISlider!
    @IBOutlet weak var YSlider: UISlider!
    @IBOutlet weak var ZSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func xOnChanged(_ sender: Any) {
        x.text = "\(XSlider.value)"
    }
    
    @IBAction func yOnChange(_ sender: Any) {
        y.text = "\(YSlider.value)"
    }
    
    @IBAction func zOnChange(_ sender: Any) {
        z.text = "\(ZSlider.value)"
    }
    
}

