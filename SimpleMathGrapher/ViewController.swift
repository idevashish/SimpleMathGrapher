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
    
    var geometryNode: SCNNode = SCNNode()
    
    // Gestures
    var xPos: Float = 0.0
    var yPos: Float = 0.0
    var zPos: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        scene.rootNode.addChildNode(cameraNode)
        
        let boxGeometry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
        let boxNode = SCNNode(geometry: boxGeometry)
        scene.rootNode.addChildNode(boxNode)
        
        geometryNode = boxNode
        
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
    }
    
    @IBAction func xOnChanged(_ sender: Any) {
        let val = XSlider.value
        x.text = "\(val)"
        
        xPos = val
        
        geometryNode.transform = SCNMatrix4MakeTranslation(xPos, yPos, zPos)
    }
    
    @IBAction func yOnChange(_ sender: Any) {
        let val = YSlider.value
        y.text = "\(val)"
        
        yPos = val
        
        geometryNode.transform = SCNMatrix4MakeTranslation(xPos, yPos, zPos)
    }
    
    @IBAction func zOnChange(_ sender: Any) {
        let val = ZSlider.value
        z.text = "\(val)"
        
        zPos = val
        
        geometryNode.transform = SCNMatrix4MakeTranslation(xPos, yPos, zPos)
    }
    
}

