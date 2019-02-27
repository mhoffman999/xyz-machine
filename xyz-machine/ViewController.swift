//
//  ViewController.swift
//  xyz-machine
//
//  Created by Michael Hoffman on 2/25/19.
//  Copyright © 2019 Here We Go. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        motionManager = CMMotionManager()
        //The ".main" represents the main queue
        //For the handler, a func was created referencing CMAccelerometerData and accompanying error logic
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
        
        
    }
    
    func updateLabels (data: CMAccelerometerData?, error: Error?) {
        //Because the "data" is optional, use guard let to create a constant
        guard let accelerometerData = data else { return }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
       
        /*
        let x = accelerometerData.acceleration.x
        let y = accelerometerData.acceleration.y
        let z = accelerometerData.acceleration.z
        print(x, y, z)
 */
        //".string" for object returns an optional value
        //But since number values can be properly encapsulated into a string, the value can be safely forced unwrapped ("!")
        //Note what happens when the "!" is removed from any of the constants
        let x = formatter.string(for: accelerometerData.acceleration.x)!
        let y = formatter.string(for: accelerometerData.acceleration.y)!
        let z = formatter.string(for: accelerometerData.acceleration.z)!
        
        print(x, y, z)
        
        //Force unwrapping the constants above removes the string interpolation error since the values are explicitly provided
        xLabel.text = "X: \(x)"
        yLabel.text = "Y: \(y)"
        zLabel.text = "Z: \(z)"
        
/*
        //Same as above without using min/max funcs in formatter
         //BUT the min/max funcs seem to make the readout less "jumpy"
        xLabel.text = String(format: "X: %.1f", accelerometerData.acceleration.x)
        yLabel.text = String(format: "Y: %.1f", accelerometerData.acceleration.y)
        zLabel.text = String(format: "Z: %.1f", accelerometerData.acceleration.z)
 */
        
    }


}

