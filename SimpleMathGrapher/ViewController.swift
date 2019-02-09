//
//  ViewController.swift
//  SimpleMathGrapher
//
//  Created by Michal Takac on 09/02/2019.
//  Copyright © 2019 QuestSpace. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: SCNView!
    
    @IBOutlet weak var x: UILabel!
    @IBOutlet weak var y: UILabel!
    @IBOutlet weak var z: UILabel!
    
    @IBOutlet weak var XSlider: UISlider!
    @IBOutlet weak var YSlider: UISlider!
    @IBOutlet weak var ZSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // sceneSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sceneSetup()
    }
    
    func sceneSetup() {
        let scene = SCNScene()
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLight.LightType.ambient
        ambientLightNode.light!.color = UIColor(white: 0.67, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
        
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = SCNLight.LightType.omni
        omniLightNode.light!.color = UIColor(white: 0.75, alpha: 1.0)
        omniLightNode.position = SCNVector3Make(0, 50, 50)
        scene.rootNode.addChildNode(omniLightNode)
        
        let boxGeometry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
        let boxNode = SCNNode(geometry: boxGeometry)
        scene.rootNode.addChildNode(boxNode)
        
        sceneView.scene = scene

        sceneView.allowsCameraControl = true
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

